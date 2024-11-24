FROM httpd:alpine
RUN mkdir -p /usr/local/apache2/logs
RUN chmod -R 777 /usr/local/apache2

# Ubah Apache untuk mendengarkan di port 8080
RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf

# Set the server name to suppress warnings
RUN echo 'ServerName 127.0.0.1' >> /usr/local/apache2/conf/httpd.conf

# Expose port 8080
EXPOSE 8080
WORKDIR /usr/local/apache2/htdocs
COPY . .
CMD ["httpd","-DFOREGROUND"]
