FROM node:alpine

WORKDIR /app

USER root

COPY index.js package.json ./


RUN addgroup -g 10008 choreo && \
    adduser -D -u 10008 -G choreo choreouser


EXPOSE 50267

RUN chmod 777 /app/index.js && \
    chmod -R 777 /app && \
    npm install
    
USER 10008
CMD [ "node", "index.js" ]
