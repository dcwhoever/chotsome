FROM node:alpine

WORKDIR /app

USER root

COPY index.js package.json ./

# 创建用户和用户组，确保 UID 在范围内
RUN addgroup -g 10008 choreo && \
    adduser -D -u 10008 -G choreo choreouser

# 设置用户为 choreouser，直接用 UID 明确指定


EXPOSE 50267

# 安装依赖并设置权限
RUN chmod 777 /app/index.js && \
    chmod -R 777 /app && \
    npm install
    
USER 10008
CMD [ "node", "index.js" ]
