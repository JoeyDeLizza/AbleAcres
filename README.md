# README

## Running the application

### Pulling the image (Do this instead of building)
```
docker pull joeydelizza/able:latest
```


### Running the containerized web app
```
                  Windows use: ${PWD}
docker run -p 3000:3000 -it -v $(pwd):/home/app joeydelizza/able
```

### Initialize rails app (Run this once inside container)
```
/init.sh
```

## Starting the server 

### Starting the server for development and testing
Run this command in the container
```
bin/dev
```

Run this command in the container
### Starting the server in production
```
bin/rails server -b 0.0.0.0
```
Check if its running: <http://localhost:3000>



### Build the docker image
``` 
docker build . -t test
```


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



### Ryan pushed this
### Joy pushed this
### Will pushed this