# DEVELOPER DOCUMENTATION

## Environment Setup

### Requirements

* Docker
* Docker Compose
* Make

### Configuration

The project is structured as follows:

* `srcs/docker-compose.yml` defines all services
* `srcs/requirements/` contains Dockerfiles and configuration for each service
* `secrets/` contains sensitive data (passwords)
* `Makefile` is used to build and manage the project

The required secret files are:

* db_root_password.txt
* db_password.txt
* wp_admin_password.txt
* wp_user_password.txt


## Build and Launch

To build and start the project:
make

To rebuild the project:
make re

To stop the project:
make down

## Managing Containers

Check running containers: make status

View logs: make logs

Docker Compose is used to manage containers defined in `docker-compose.yml`.


## Data Persistence

Data is stored using volumes or bind mounts defined in Docker Compose.

* MariaDB data is stored persistently
* WordPress files are stored in mounted directories

Data remains available even if containers are stopped or removed.
