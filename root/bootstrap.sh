mkdir -p /var/www/services

service php8.3-fpm start \
  && nginx -g "daemon off;"
