### Workshop 5: Run Container with Map Host Volume

1. Setup file sharing on docker option to current directory before operate / Apply & Restart

2. View file index.html on VSCode or other text editor

3. Run docker for nginx web server with map file index.html by command:
	#### Docker for MAC:
	````
	docker run -dt --name nginxtest -v $(pwd)/source:/opt/bitnami/nginx/html:ro -p 80:8080 -p 443:8443 3dsinteractive/nginx:1.12
     ````
    
	#### Docker for Windows:
	````
	docker run -dt --name nginxtest -v %cd%/source:/opt/bitnami/nginx/html:ro -p 80:8080 -p 443:8443 3dsinteractive/nginx:1.12
	````

4. open browser with url: http://localhost https://localhost

5. Edit file index.html by add Test "WORKSHOP"

6. Refresh browser again for check changed:

    ````html
    <!DOCTYPE html>
    <html>
    <head>
    <title>Welcome to nginx!</title>
    <style>
        body {
            width: 35em;
            margin: 0 auto;
            font-family: Tahoma, Verdana, Arial, sans-serif;
        }
    </style>
    </head>
    <body>
    <h1>Welcome to nginx! WORKSHOP</h1>
    <p>If you see this page, the nginx web server is successfully installed and
    working. Further configuration is required.</p>
    
    <p>For online documentation and support please refer to
    <a href="http://nginx.org/">nginx.org</a>.<br/>
    Commercial support is available at
    <a href="http://nginx.com/">nginx.com</a>.</p>
    
    <p><em>Thank you for using nginx.</em></p>
    </body>
    </html>
     ````
7. Stop container and remove from system by command:
     ````
     docker stop nginxtest
     docker rm nginxtest
    ````