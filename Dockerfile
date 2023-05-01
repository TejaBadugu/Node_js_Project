FROM node:18-alpine

WORKDIR /root/Node_js_Project

COPY package*.json ./

RUN  npm install

COPY . .

EXPOSE 3000

CMD ["npm","server.js"]
