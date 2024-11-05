
FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx && \
    apt-get clean

RUN apt install -y openssl 

RUN mkdir -p /etc/nginx/ssl

RUN chmod 777 /etc/nginx/ssl

RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=dliuzzo.42.fr/UID=dliuzzo"
COPY default /etc/nginx/sites-available/.
COPY nginx.conf /etc/nginx/.

CMD ["nginx", "-g", "daemon off;"]
