FROM php:5.4-apache

RUN apt-get update
RUN apt-get install -y g++ 

# enable header module
RUN ln -s /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled

# install mbstring extension
RUN docker-php-ext-install mbstring

# install gd extension
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libgd-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr
RUN docker-php-ext-install gd exif

# install mysql extension
RUN docker-php-ext-install mysql mysqli pdo pdo_mysql 

# install zip archive extension
RUN docker-php-ext-install zip

# enable mod_rewrite
RUN a2enmod rewrite

RUN apt-get autoremove -y && apt-get clean all

CMD ["apache2", "-D", "FOREGROUND"]