# Docker setup

## Installation
To use this template, you must have [Docker](https://docs.docker.com/get-started/docker-overview/) installed.
Assuming you are using nginx on your local machine, there should be nginx server configured with name docker-simple.local.

### Ubuntu
Add the following line to /etc/hosts:
```shell
127.0.0.1	docker-simple.local
```

## Usage
Run the following commands to build and start your containers:
```shell
docker compose up -d --build
```

## Simple PHP script
Application on PHP 8.3, nginx.
Contains the configuration for running the simplest index.php from Docker container.

Accessing the PHP (app) container via Shell:
```shell
docker exec -it docker-simple-app-php bash
```

When visiting http://docker-simple.local:8083/ you should see the PHP 8.3 info page.