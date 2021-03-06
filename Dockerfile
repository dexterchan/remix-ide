FROM node:10.15.0-stretch-slim

RUN apt-get update
RUN apt-get -y install python
RUN apt-get -y install openssl
RUN apt-get -y install build-essential
RUN apt-get -y install git
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/src/app:/usr/local/bin:$PATH
EXPOSE 8080

RUN cd /usr/src/app
COPY . /usr/src/app
RUN rm -Rf node_modules/
RUN npm install
CMD ["npm","start"]
