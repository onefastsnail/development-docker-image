[![CircleCI](https://circleci.com/gh/onefastsnail/development-docker-image.svg?style=svg)](https://circleci.com/gh/onefastsnail/development-docker-image)

# Development Docker Image

A [Docker](https://www.docker.com/) image to run development commands and tools through. This helps keep the host machine clean of libaries, tools and their numerous versions and also helps keep a consistent set of development tools across a development team and machines.

This repository is put through [CircleCI](https://circleci.com) for automated building, testing and deployment to [Dockerhub](https://hub.docker.com/r/onefastsnail/development).

## What's inside

* [PHP 7.2](http://www.php.net/)
* MySQL client (idea is to link a database container)
* [Node 8](https://nodejs.org/en/) with [Yarn](https://yarnpkg.com/en/)
* [Composer](https://getcomposer.org/)
* [WP CLI](https://wp-cli.org/)

## Usage

To start using this we can directly bash into the container, mounting the current working directory into the container also. This way, we have access to the project and its dependencies such as `node_modules` and `vendor` packages. Finally we remove the container when we exit or finish, making it disposable.

* `docker run -it --rm -v $(pwd):/app onefastsnail/development bash`

### Commands

We can also run a single command through the container, ideal for creating alias or helper scripts for common tasks.

#### Node / Yarn

* `docker run -it --rm -v $(pwd):/app onefastsnail/development node -v`
* `docker run -it --rm -v $(pwd):/app onefastsnail/development yarn install`

#### PHP

* `docker run -it --rm -v $(pwd):/app onefastsnail/development php -v`

#### MySQL

Assuming you have a container named `mydb`.

* `docker run -it --rm -v $(pwd):/app --link mydb onefastsnail/development mysql --host=mydb --user=root --password=pass`

#### Composer

* `docker run -it --rm -v $(pwd):/app onefastsnail/development composer --version`
* `docker run -it --rm -v $(pwd):/app onefastsnail/development composer install`

#### WP CLI

* `docker run -it --rm -v $(pwd):/app onefastsnail/development wp --allow-root --version`