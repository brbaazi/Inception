# *INCEPTION*

*This project has been created as part of the 42 curriculum by brbaazi*

This project is about creating a web application infrastructure using Docker and Docker Compose. It includes Nginx, WordPress, and MariaDB, which are connected together in the same network.

First, I set up each service individually. Each one has a Dockerfile and a script.sh or .conf file to create an image and install all the dependencies that it needs.
In the end, when we run Docker Compose, it starts ready-to-use containers.

## 🔧 INSTRUCTIONS

**Requirements:**

* Docker
* Docker Compose
* Make

**Run this project:** `make`
**Rebuild the project:** `make re`
**Stop the project:** `make down`
**Show running containers:** `make status`
**Show logs:** `make logs`

## ⚙️ *Project description*

Docker is used to create isolated environments called containers. Each service (Nginx, WordPress, MariaDB) runs in its own container.

Docker Compose is used to define and manage all services in a single configuration file.

**Design choices:**

* Each service has its own Dockerfile.
* Services communicate through a Docker network.
* Volumes are used to ensure data persistence.
* Secrets are used to store sensitive information securely.

## 📊 *Comparisons*

**Virtual Machines vs Docker**
Virtual Machines emulate a full operating system, while Docker containers share the host kernel and are more lightweight and faster.

**Secrets vs Environment Variables**
Environment variables are simple but not secure. Secrets are used to store sensitive data such as passwords in a secure way.

**Docker Network vs Host Network**
Docker networks allow containers to communicate in an isolated environment, while the host network shares the host system network directly.

**Docker Volumes vs Bind Mounts**
Docker volumes are managed by Docker and stored in a dedicated location, making them more portable and secure, while bind mounts directly link a host directory to a container, giving more control but less portability.

## 📚 Resources

* Docker documentation: https://docs.docker.com/
* Nginx documentation: https://nginx.org/en/docs/
* WordPress documentation: https://wordpress.org/documentation/
* MariaDB documentation: https://mariadb.org/documentation/
* YouTube tutorials for Docker and Nginx basics
* AI tools (ChatGPT, Google Gemini) were used to understand concepts.
