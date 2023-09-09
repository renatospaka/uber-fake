FROM node:16.16-alpine3.16

RUN apk update && apk upgrade && \
    apk add --no-cache bash curl && \
    apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

WORKDIR /home/node/app

RUN npm install npm@9.6.5 --location=global && \
    npm install typescript --location=global && \
    npm install nodemon --location=global

COPY package*.json ./
RUN yarn install

USER node
COPY . ./

# CMD [ "yarn", "start" ]
CMD ["tail", "-f", "/dev/null"]