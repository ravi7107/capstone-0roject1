# Use official Apache image
FROM httpd:2.4

# Copy website files into Apache document root
COPY . /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
