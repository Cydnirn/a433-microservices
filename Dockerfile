FROM node:18-bookworm-slim

ENV PORT 3000

WORKDIR /home/node/app

USER node

RUN mkdir /home/node/app

COPY --chown=node:node package*.json .

RUN npm install

COPY --chown=node:node . .

CMD [ "npm", "start" ]
