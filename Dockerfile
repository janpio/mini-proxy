# syntax=docker/dockerfile:1

FROM node:18-alpine
ENV DEBUG=*

RUN apk add --update bash openssl

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

#probably don't even need this
RUN npm run certs 

COPY . .

CMD ["npm", "run", "server"]