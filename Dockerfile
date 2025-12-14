# Use the pre-built base image
FROM hshar/webapp

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy your application code into the container
COPY . /var/www/html

# Expose port 80
EXPOSE 80

# Start the web server (assuming Apache is in the base image)
CMD ["apache2-foreground"]
