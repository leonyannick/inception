# inception

This project is about using Docker to set up a wordpress website using with NGINX as the webserver and MariaDB as the Database.

The full subject can be found here: [inception.pdf](./inception.pdf).

# Downloading and compiling the project

The project only works if Docker is installed on your machine.

Clone the repository and use `make` to compile.

# Details about the project infrastructure

Each service has their own Docker container and their interaction is orchastrated with Docker-compose.

This image shows the structure of the project:

![Project outline](.images/project_outline.png)


