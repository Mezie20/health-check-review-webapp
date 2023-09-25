## using Nodejs base image
FROM node:14

## defining working directory
WORKDIR /app

## using the root user to execute the container image
USER root

## copying he Nodejs dependency file
## for thr destination you can use . or /app/ because the file is in your WORKDIR in your container. # COPY package.json . or COPY . . 
COPY package.json .

## installing npm for nodejs
RUN npm install

## copying all application files to the workdir # COPY . /app or COPY . .
COPY .  /app/

## exposing port number
EXPOSE 80

## health check command
HEALTHCHECK --interval=12s --timeout=12s --start-period=12s \  
    CMD node healthcheck.js

## executing web application - /app/server.js 
CMD [ "node", "server.js" ]




