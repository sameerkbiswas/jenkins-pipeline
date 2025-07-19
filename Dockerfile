# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Copy the custom index.html to the default location
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80
