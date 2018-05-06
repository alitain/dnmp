FROM nginx:alpine

RUN sed -i '/include\ \/etc\/nginx\/conf\.d\/\*\.conf;/a include\ \/etc\/nginx\/sites-available\/\*\.conf;' /etc/nginx/nginx.conf

RUN rm /etc/nginx/conf.d/default.conf \
&& echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
