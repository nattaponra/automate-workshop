Workshop 23 : Tuning NGINX for production

Nginx = N-GIN-X = Engine-X

1. Default configuration file location

  /etc/nginx/nginx.conf

2. Basic command and option

  2.1 Start Nginx web server

    # nginx

  2.2 Reload configuration

    # nginx -s reload

  2.3 Stop Nginx web server

    # nginx -s stop

3. Nginx Configuration Structure

```
main
 |
  `-> http > server > location
```

```
# main context
...

events {
  # events block, context
  ...
}

http {
  # http block, context
  ...
  upstream {
    # upstream block, context
    ...
  }

  server {
    # server block, context
    listen 80; # <-- directive
    ...

    location / {
      # location context, block
      ...
      if(...) {
        # if block, context
        ...
      }
    }

    location /foo {
      ...
    }
    ...
  }

  server {
    ...
  }
}
```

4. Tuning Nginx

  4.1 main block, context tuning

  ```
    worker_processes 4;
    worker_rlimit_nofile 500000;
  ```

  Get number of processes

    # grep processor /proc/cpuinfo | wc -l

  - worker_processes
      Defines the number of worker processes., auto = autodetected

  - worker_rlimit_nofile
      The limit on the maximum number of open files

  4.2 events block

    ```
    events {
        worker_connections  200240;
        use epoll;
        multi_accept on;
    }
    ```

    - worker_connections
        Maximum number of simultaneous connections that can be opened by a worker process

    - use epoll
        Event notification mechanism, Linux 2.6+

    - multi_accept
        A worker process will accept all new connections at a time.


FYI : ulimit - user limit

  - Show all limit

    # ulimit -a

  - Show number of oopen file

    # ulimit -n

  - Set limit
    Example. set open file

    # ulimit -n 200240

    4.3 http block

      ```
      http {
        ...

        client_body_buffer_size     128k; # Most client buffers are coming from POST method form submissions
        client_max_body_size        10m;  # Sets the max body buffer size, Error 413
        client_header_buffer_size   1k;   # Sets buffer size for reading client request header, default 1k
        large_client_header_buffers 4 4k; # The maximum number and size of buffers used for reading large client request header.

        sendfile    on;
        tcp_nopush  on;
        tcp_nodelay on;

        keepalive_timeout  65;
        keepalive_requests 100000;

        gzip on;
        gzip_http_version 1.0;
        gzip_comp_level 2;
        gzip_proxied any;
        gzip_types text/plain text/css application/x-javascript text/xml application/xml application/xml+rss text/javascript;

        ...

        proxy_cache_path /data/nginx/cache levels=1:2 keys_zone=web:10m;

        upstream web {
            ...
            server web1:8080;
            server web2:8080;
        }

        ...
      }
      ```

    4.4 server block

      ```
      server {
        listen 80;
        server_name example.com;
        ...

        # CORS = Cross Origin Resource Sharing, AJAX API's Call

        add_header Access-Control-Allow-Origin $http_origin always;
        add_header Access-Control-Allow-Credentials true always;
        add_header Access-Control-Allow-Methods 'GET, POST, PUT, DELETE, OPTIONS, HEAD' always;
        add_header Access-Control-Allow-Headers 'Content-Type, Cache-Control, X-Requested-With, X-Prototype-Version' always;

        ...
      }
      ```

    4.5 location block

      ```
      ...

      location / {
          proxy_pass http://web;
          proxy_redirect off;
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

          proxy_connect_timeout      90;
          proxy_send_timeout         90;
          proxy_read_timeout         90;
          proxy_buffer_size          4k;
          proxy_buffers              4 32k;
          proxy_busy_buffers_size    64k;
          proxy_temp_file_write_size 64k;

          # Caching
          proxy_cache web;
          proxy_cache_valid 200 302 10m;
          proxy_cache_valid 404 1m;
          add_header  X-Cache-Status $upstream_cache_status;
          expires     10m;

      }
      ...

      ```

