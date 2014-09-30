Twitter App de Popularidad en Heroku
=========
Sistemas y Tecnologías web
---------------------------


Objetivo
-----

Hacer que la aplicación [twitter de popularidad], creada anteriormente, se despliegue en Heroku (plataforma como servicio de computación en la Nube que soporta distintos lenguajes de programación), además de incorporar el uso de tests. 

Funcionamiento
-----

Hay dos formas posibles de ver el funcionamiento de la aplicación, una mediante la web, gracias a Heroku, y otra desde local, y ésta última permitirá ver el resultado de los test.
 
1. Visualización en Heroku
    
    Para poder ver la aplicación en dicha plataforma, haz click [aquí].
    Una vez ahí sólo has de poner cualquier usuario twitter, y verás la popularidad de sus amigos.

2. Visualización en local

    Primero se ha de clonar el repositorio de github [twitter-popular-heroku], de la siguiente forma: 
    
    ```sh
    user@ubuntu-hp:~$ git clone git@github.com:alu0100700435/twitter-popular-heroku.git
    ```
    Una vez clonado el repositorio, y situado en el directorio, modifique el archivo configure.rb con sus claves(recomendado). Y a continuación ejecuta bundler:
    
    ```sh
    user@ubuntu-hp:~/twitter-popular-heroku$ bundle install
    ```
    
    Una vez hecho todo lo anterior, procede a ejecutar *rake*, y por defecto se ejecutarán los tests, y para que la aplicación arranque *rake server*, como puedes ver a continuación:
    
    ```sh
    user@ubuntu-hp:~/twitter-popular-heroku$ rake
    Run options: --seed 62981
    
    # Running tests:
    
    .F..
    
    Finished tests in 4.506182s, 0.8877 tests/s, 0.8877 assertions/s.
    
      1) Failure:
    test_0004_should return user's wrong number of friends(Twitter Popular) [/home/user/Escritorio/twitter-popular-heroku/test.rb:35]:
    849
    
    4 tests, 4 assertions, 1 failures, 0 errors, 0 skips

    user@ubuntu-hp:~/twitter-popular$ rake server
    == Sinatra/1.4.5 has taken the stage on 4567 for development with backup from Thin
    Thin web server (v1.6.2 codename Doc Brown)
    Maximum connections set to 1024
    Listening on localhost:4567, CTRL+C to stop
    ```
    
    Una vez en ejecución, abre el navegador y escribe en la barra de direcciones *localhost:4567* y accederás a la web de la aplicación:
    
    ![ejemplo navegador](https://raw.githubusercontent.com/alu0100700435/twitter-popular-heroku/gh-pages/public/ejemplo.png) 
    
    Y ya, sólo has de poner el usuario twitter que desees y enviar, y así apareceran sus amigos más populares. 
    
    
NOTA: 
Es probable, que si el usuario elegido tiene muchos amigos, la aplicación tarde en responder o no responda debido a un excesivo tiempo de acceso.


[twitter de popularidad]:https://alu0100700435.github.io/twitter-popular
[aquí]:https://agile-fortress-1869.herokuapp.com
[twitter-popular-heroku]:https://github.com/alu0100700435/twitter-popular-heroku
