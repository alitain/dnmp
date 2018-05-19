FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf \
&& rm /etc/nginx/nginx.conf

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./upstream.conf /etc/nginx/conf.d/upstream.conf

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
