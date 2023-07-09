FROM alpine

RUN apk update && apk add bash imagemagick

WORKDIR /app

ADD Scripts Scripts

ENTRYPOINT ["bash", "/app/Scripts/menu.sh"]
