# circleci-php
Dockerfile based on `circleci/php:7.1-fpm-node-browsers` to run tests for PHP applications. 

## Purpose
This image contains **node**, **AWS CLI**, **ImageMagick** and **Ghostscript**. If your application handles image or PDF files, this might be a starting point to build your own images for testing. 

This is only intended to use for running tests on [CircleCI](https://circleci.com/) or its [CLI](https://github.com/circleci-Public/circleci-cli). Please don't think to use it for any other purposes.


## Base Image
```
circleci/php:7.1-fpm-node-browsers
```

## PHP Information
```php
# php --version
PHP 7.1.26 (cli) (built: Jan 22 2019 23:03:24) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.1.0, Copyright (c) 1998-2018 Zend Technologies
    with Zend OPcache v7.1.26, Copyright (c) 1999-2018, by Zend Technologies
    with Xdebug v2.6.1, Copyright (c) 2002-2018, by Derick Rethans

# php -m
[PHP Modules]
Core
ctype
curl
date
dom
exif
fileinfo
filter
ftp
gd
hash
iconv
imagick
intl
json
libxml
mbstring
mcrypt
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
readline
Reflection
session
SimpleXML
SPL
sqlite3
standard
tokenizer
xdebug
xml
xmlreader
xmlwriter
Zend OPcache
zip
zlib

[Zend Modules]
Xdebug
Zend OPcache
```

## Application Paths and Versions

### node
```
/usr/local/bin/node
v10.15.1
```

### Ghostscript
```
/usr/bin/gs
GPL Ghostscript 9.26 (2018-11-20)
Copyright (C) 2018 Artifex Software, Inc.  All rights reserved.
```

### ImageMagick
```
/usr/bin/convert
Version: ImageMagick 7.0.8-26 Q16 x86_64 2019-02-07 https://imagemagick.org
Copyright: © 1999-2019 ImageMagick Studio LLC
License: https://imagemagick.org/script/license.php
Features: Cipher DPC HDRI OpenMP
Delegates (built-in): bzlib djvu fontconfig freetype gvc jbig jng jp2 jpeg lcms lqr lzma openexr png tiff wmf x xml zlib
```

### AWS CLI
```
/usr/local/bin/aws
aws-cli/1.16.99 Python/2.7.13 Linux/4.9.125-linuxkit botocore/1.12.89
```
