
FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx && \
    apt-get clean

COPY default /etc/nginx/sites-available/.
COPY nginx.conf /etc/nginx/.

CMD ["nginx", "-g", "daemon off;"]
