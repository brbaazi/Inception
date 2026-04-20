FROM debian:bookworm

RUN apt update && apt install -y \
    php \
    php-fpm \
    php-mysql \
    wget \
    curl \
    mariadb-client

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Create directory
RUN mkdir -p /var/www/html

WORKDIR /var/www/html

# Download WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    mv wordpress/* . && \
    rm -rf wordpress latest.tar.gz

# Configure php-fpm
RUN sed -i 's/listen = .*/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf

# Copy setup script
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

EXPOSE 9000

CMD ["/setup.sh"]