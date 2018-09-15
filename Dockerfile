FROM node:10-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/src/app:/usr/local/bin:$PATH
EXPOSE 8080

RUN cd /usr/src/app
COPY . /usr/src/app

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN npm install

CMD ["npm","start"]
