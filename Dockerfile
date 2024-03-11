#Production stage 
FROM node:18-bookworm-slim
ENV PORT 3000
USER node
RUN mkdir /home/node/app
WORKDIR /home/node/app
COPY --chown=node:node package*.json .
RUN npm install
COPY . .
CMD [ "npm", "start" ]
