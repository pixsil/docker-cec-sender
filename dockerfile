FROM balenalib/rpi-raspbian:buster

RUN apt-get update && apt-get upgrade -y

RUN install_packages cec-utils

RUN apt-get update

RUN apt-get install apache2 php -y

RUN usermod -a -G video root
RUN usermod -a -G video www-data

RUN mkfifo /tmp/cec-pipe-in -m 777

COPY src/ /var/www/html/

WORKDIR /var/www/html
RUN chmod +x start.sh
CMD ./start.sh
