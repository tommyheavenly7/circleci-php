FROM circleci/php:7.1-fpm-node-browsers

USER root

# install
RUN apt-get update && apt-get install -y \
    acl libexif-dev libfreetype6-dev libgd-dev libgs-dev libicu-dev libjpeg-dev \
    libjpeg62-turbo-dev libmagic-dev libmagickwand-dev libmcrypt-dev libmcrypt4 \
    libpng++-dev libvpx-dev openssh-client openssl mysql-client python-pip groff-base wget

# PHP extensions
## ghostscript release versions: https://github.com/ArtifexSoftware/ghostpdl-downloads/releases
RUN cd /tmp \
    && wget https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs926/ghostpdl-9.26.tar.gz \
    && tar xzvf ghostpdl-9.26.tar.gz \
    && cd ghostpdl-9.26 \
    && ./configure --disable-compile-inits --with-drivers=ALL --without-luratech --with-libiconv=gnu --prefix=/usr \
    && make \
    && make install

## imagemagick release versions: http://www.imagemagick.org/download/
RUN cd /tmp \
    && wget http://www.imagemagick.org/download/ImageMagick.tar.gz \
    && tar xzvf ImageMagick.tar.gz \
    && cd ImageMagick* \
    && ./configure --prefix=/usr --with-webp=no \
    && make \
    && make install

## imagick release versions: https://pecl.php.net/package/imagick
RUN pecl install imagick-3.4.3 \
    && docker-php-ext-enable imagick

## other extensions
RUN docker-php-ext-install exif
RUN docker-php-ext-install gd
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install pdo_mysql

## add ini
RUN printf "[date]\ndate.timezone=Etc/UTC" > /usr/local/etc/php/conf.d/date.ini
RUN echo "memory_limit=512M" > /usr/local/etc/php/conf.d/memory-limit.ini

# aws cli
RUN pip install --upgrade awscli

# clean up
RUN rm -rf /var/lib/apt/lists/*
