FROM alpine:latest

RUN apk update && apk add bash

WORKDIR /app

COPY . /app

RUN chmod +x /app/shift_sched.sh
RUN chmod +x /app/assets/*

CMD ["./shift_sched.sh"]