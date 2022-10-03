# README

## Running the application

### Build the docker image
``` 
docker build . -t test
```

### Running the containerized web app
```
docker run -p 3000:3000 test -it -v $(pwd):/home/app
```

### Starting the server 
```
In the docker container execute
[root@2313sfd1]# bin/rails -b 0.0.0.0
```
Check if its running: <http://localhost:3000>


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
