FROM node:alpine

WORKDIR /app

COPY index.js package.json ./

USER root

EXPOSE 50267

#ENV PM2_HOME=/tmp
#    npm install -g pm2 &&\
#RUN apk add --no-cache iproute2 vim netcat-openbsd curl &&\


RUN addgroup -g 10008 choreo &&\
    adduser -D -u 10008 -G choreo choreouser &&\
    chmod 777 /app/index.js  && \
    chmod -R 777 /app && \
    npm install

CMD [ "node", "index.js" ]

USER choreouser
