FROM phalconphp/ubuntu-16.04:php-7.2

# "/app" is a working directory as it set in parent image. We copy all files
# inside current working dir. This approach implies that we don't use the
# current container to install PHP dependencies using composer and build any
# project related stuff. Any required project dependencies should be obtained
# on host system or via special build images. We're use this image as a real
# container for the application, not as a build system.
#COPY . /app
# Copy configuration
#RUN cp -f ./app/config/config.ini /app/app/config/config.ini

# However, composer is here, and you can always use it if this is your strategy
# to build application image.
#RUN composer --version

# Install MongoDB extension
#RUN apt-get update -y \
#    && apt-get \
#    -o Dpkg::Options::="--force-confdef" \
#    -o Dpkg::Options::="--force-confold" \
#    install -y -f --no-install-recommends \
#      dnsutils \
#      php7.2-mongodb
# Enable mongodb extension since it's already installed
RUN ln -s /etc/php/7.2/mods-available/mongodb.ini /etc/php/7.2/cli/conf.d/25-mongodb.ini
RUN ln -s /etc/php/7.2/mods-available/mongodb.ini /etc/php/7.2/fpm/conf.d/25-mongodb.ini