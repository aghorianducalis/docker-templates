# Use the official PHP 8.3 FPM image
FROM php:8.3-fpm

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
WORKDIR /var/www/html

# Copy your app's code to the container
COPY . /var/www/html

# Expose port 80
#EXPOSE 80

# Start PHP-FPM and Nginx
#CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
