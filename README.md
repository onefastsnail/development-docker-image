[![CircleCI](https://circleci.com/gh/onefastsnail/development-docker-image.svg?style=svg)](https://circleci.com/gh/onefastsnail/development-docker-image)

# Development Docker Image

A [Docker](https://www.docker.com/) image i created for development to help keep my host machine clean of libaries and tools. This approach also helps keep a consistent set of development tools across a development team and machines.

This repo is put through [CircleCI](https://circleci.com) for automated building, testing and deployment to [Dockerhub](https://hub.docker.com/r/onefastsnail/development).

## What's inside

* [PHP 7.2](http://www.php.net/)
* MySQL client (idea is to link a database container)
* [Node 8](https://nodejs.org/en/) with [Yarn](https://yarnpkg.com/en/)
* [Composer](https://getcomposer.org/)
* [WP CLI](https://wp-cli.org/)

## Usage

To start using this we can directly shell into the container, mounting the current working directory in the container also. Finally we remove the container when we exit or finish.

* `docker run -it --rm -v $(pwd):/app onefastsnail/development:1.0.0 bash`

### Commands

We can also run a single command through the container, ideal for creating alias or helper scripts.

* `docker run -it --rm -v $(pwd):/app onefastsnail/development:1.0.0 php -v`
* `docker run -it --rm -v $(pwd):/app onefastsnail/development:1.0.0 node -v`
* `docker run -it --rm -v $(pwd):/app onefastsnail/development:1.0.0 composer --version`
* `docker run -it --rm -v $(pwd):/app onefastsnail/development:1.0.0 wp --allow-root --version`

* `docker run -it --rm -v $(pwd):/app onefastsnail/development:1.0.0 composer install`
* `docker run -it --rm -v $(pwd):/app onefastsnail/development:1.0.0 yarn install`