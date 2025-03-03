# Use an official lightweight web server image
FROM nginx:latest

# Copy website files to NGINX web directory
ADD . /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
