FROM ubuntu:16.04

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    php-dompdf \
    php-mbstring \
    php-mysql \
    php-sqlite3 \
    libapache2-mod-php \
    vim \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND noninteractive
RUN add-apt-repository ppa:deadsnakes/ppa && apt-get update && apt-get install -y \
    python3.7 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

COPY docker/requirements.txt /tmp/requirements.txt
RUN python3.7 -m pip install -r /tmp/requirements.txt && rm /tmp/requirements.txt

RUN sed -i -e 's|;extension=php_pdo_sqlite|extension=php_pdo_sqlite|g' \
    -e 's|;extension=php_sqlite|extension=php_sqlite|g' /etc/php/7.0/apache2/php.ini && \
    echo '<VirtualHost *:80>\n\
        ServerAdmin webmaster@localhost\n\
        DocumentRoot /var/www/html\n\
        ErrorLog ${APACHE_LOG_DIR}/error.log\n\
        CustomLog ${APACHE_LOG_DIR}/access.log combined\n\
        <Directory /var/www/html>\n\
        Options Indexes FollowSymLinks MultiViews\n\
        AllowOverride All\n\
        Require all granted\n\
        </Directory>\n\
        </VirtualHost>\n' > /etc/apache2/sites-available/000-default.conf

RUN /usr/sbin/a2enmod rewrite

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
