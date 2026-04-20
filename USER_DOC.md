# USER DOCUMENTATION

## Overview

This project provides a web application stack composed of:

* Nginx (web server)
* WordPress (application)
* MariaDB (database)

These services work together to deliver a functional website.

## Start and Stop the Project

Start:
make

Stop:
make down

## Access the Website

Open your browser and go to:
https://brbaazi.42.fr

Admin panel:
https://brbaazi.42.fr/wp-admin

## Credentials

Credentials are stored using Docker secrets inside the `secrets/` directory.

The following files contain sensitive information:

* db_root_password.txt → MariaDB root password
* db_password.txt → Database user password
* wp_admin_password.txt → WordPress admin password
* wp_user_password.txt → WordPress user password

These credentials are automatically loaded by the containers at startup.

## Check Services Status

Check running containers:
make status

View logs:
make logs

If all services are running, the website should be accessible from the browser.
