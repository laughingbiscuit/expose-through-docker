FROM alpine:3.15
RUN apk update
RUN apk add busybox-extras
COPY content /home
CMD httpd -h /home -p 8080 -f
