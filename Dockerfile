FROM alpine:latest

RUN apk update && apk add --no-cache bash ttyd

WORKDIR /app

COPY . /app

RUN chmod +x /app/shift_sched.sh
RUN chmod +x /app/assets/*

CMD ["ttyd","--writable", "-p", "8080", "bash", "./shift_sched.sh"]