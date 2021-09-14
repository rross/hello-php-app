FROM php:7-apache

# If the container's stdio is connected to systemd-journald,
# /proc/self/fd/{1,2} are Unix sockets and apache will not be able to open()
# them. Use "cat" to write directly to the already opened fds without opening
# them again.
RUN sed -i 's#ErrorLog /proc/self/fd/2#ErrorLog "|$/bin/cat 1>\&2"#' /etc/apache2/apache2.conf
RUN sed -i 's#CustomLog /proc/self/fd/1 combined#CustomLog "|/bin/cat" combined#' /etc/apache2/apache2.conf

# change the port and user apache is using. port 80 requires root level privileges
RUN sed -i 's/80/8080/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf
USER www-data

ADD index.php /var/www/html/index.php

