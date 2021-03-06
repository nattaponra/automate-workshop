
### Workshop 06: Basic Development Stack

1. Go to project directory
    ````
     cd laravel-quickstart
    ````
2. Run composer update using composer image
for MAC:
    ````
     ./composer-update.sh
    ````
for Windows:
 composer-update.bat

4. Add hosts for new network name

    ##### for MAC: 
    edit /private/etc/hosts add
    ````
    127.0.0.1 laravel-quickstart.local
    127.0.0.1 laravel-quickstart-db.local
    ````

    ##### for Windows:
    edit c:\windows\system32\drivers\etc\hosts
    ````
    127.0.0.1 laravel-quickstart.local
    127.0.0.1 laravel-quickstart-db.local
    ````

5. Start docker
    for MAC
    ````
     ./start-docker.sh
    ````
    for Windows:
    ````
     start-docker.bat
    ````
6. run migration using docker-compose exec
for MAC
    ````
     ./migrate.sh
    ````
    for Windows:
    ````
     migrate.bat
    ````
7. browse http://laravel-quickstart.local in browser

8. browse http://laravel-quickstart-db.local in browser

9. Stop dockers
    for MAC:
    ````
     ./stop-docker.sh
    ````
    for Windows:
    ````
     stop-docker.bat
    ````