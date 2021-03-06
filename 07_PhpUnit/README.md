

### Workshop 07: PhpUnit

1. Go to project directory
    ````
    cd laravel-quickstart
    ````
2. Run composer update using composer image
    ##### for MAC:
    ````
    ./composer-update.sh
    ````
    ##### for Windows:
    ````
    composer-update.bat
    ````
3. Add hosts for new network name
    ##### for MAC:
    edit /private/etc/hosts add
    ````
    127.0.0.1 laravel-quickstart.local
    127.0.0.1 laravel-quickstart-db.local
    
    ````
    #####for Windows:
    edit c:\windows\system32\drivers\etc\hosts
    ````
    
    127.0.0.1 laravel-quickstart.local
    127.0.0.1 laravel-quickstart-db.local
    ````
4. Start docker
    #####for MAC
    ````
     ./start-docker.sh
    ````
    #####for Windows:
    ````
    start-docker.bat
    ````
5. run test using docker-compose exec
    #####for MAC
    ````
     ./runtest.sh
    ````
    #####for Windows:
    ````
    runtest.bat
    ````

7. Stop dockers
   #####for MAC:
   ````
     ./stop-docker.sh
   ````
   #####for Windows:
   ````
     stop-docker.bat
   ````
8. Have a look at phpunit.xml
   ````
    <env name="DB_CONNECTION" value="mysqltest" />
   ````
9. Have a look at web/config/database.php
   ````php
    'mysqltest' => [
                'driver'    => 'mysql',
                'host'      => env('DBTEST_HOST', 'mysqltest'),
                'database'  => env('DBTEST_DATABASE', 'my_database'),
                'username'  => env('DBTEST_USERNAME', 'my_user'),
                'password'  => env('DBTEST_PASSWORD', 'my_password'),
                'charset'   => 'utf8',
                'collation' => 'utf8_unicode_ci',
                'prefix'    => '',
                'strict'    => false,
                'engine'    => null,
            ],
    ````
10. Have a look at tests/UATTest.php

11. Have a look at tests/FunctionalTest.php

12. Have a look at UnitTest.php

