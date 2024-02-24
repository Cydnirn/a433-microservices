#Build stage
FROM node:14 AS build
RUN apt-get update && apt-get upgrade -y
WORKDIR /app
COPY package*.json .
RUN npm install --production --unsafe-perm
COPY . .
RUN npm run build && rm -rf node_modules

#Production stage
FROM node:14-slim
ENV NODE_ENV=production DB_HOST=item-db
USER node
RUN mkdir /home/node/app
WORKDIR /home/node/app
COPY --chown=node:node --from=build /app .
COPY --chown=node:node --from=build /app/package*.json .
RUN npm ci 
EXPOSE 8080
CMD [ "npm", "start" ]
