FROM nginx:alpine

# Copy custom config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy UI files
COPY index.html /usr/share/nginx/html/
COPY assets /usr/share/nginx/html/assets/
