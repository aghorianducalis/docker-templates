# Use the official PHP 8.3 FPM image
FROM php:8.3-fpm

# Set the working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy the application code into the container
COPY . /var/www/html

# Set permissions dynamically based on build arguments
ARG USER_ID
ARG GROUP_ID
RUN chown -R ${USER_ID}:${GROUP_ID} /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache
#RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
#    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Drop back to our unprivileged user
USER www-data

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]

# Install any additional PHP extensions or dependencies here, if needed
# RUN docker-php-ext-install pdo pdo_mysql
# RUN apt-get update && apt-get install -y nginx

# Remove the existing default configuration file in sites-enabled
#RUN rm /etc/nginx/sites-enabled/default

# Copy Nginx configuration file
#COPY nginx.conf /etc/nginx/sites-available/default

# Link Nginx site configuration
#RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# Set the working directory
#WORKDIR /var/www/html

# Copy your app's code to the container
#COPY . /var/www/html

# Expose port 80
#EXPOSE 80

# Start PHP-FPM and Nginx
#CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
