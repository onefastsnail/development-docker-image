FROM phusion/baseimage:0.9.22

RUN add-apt-repository ppa:ondrej/php && \
	apt-get update && \
	apt-get install -y \
  wget \
  curl \
  git \
  php7.2-fpm \
  php7.2-mysql \
  php7.2-cli \
  php7.2-curl \
  mysql-client

# lets add some hosts to prove authenticity of some hosts
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts

# install node and yarn
RUN bash -c "curl -sL https://deb.nodesource.com/setup_8.x | bash -"
RUN bash -c "apt-get install -y nodejs"
RUN bash -c "npm install -g yarn"

# install php composer
RUN bash -c "curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer"

# install wp cli
RUN bash -c "curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
RUN bash -c "chmod +x wp-cli.phar"
RUN bash -c "mv wp-cli.phar /usr/local/bin/wp"

# set our working directory as we bash or run commands here
WORKDIR /app

CMD ["bash"]