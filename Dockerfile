## Use slim to be not bloated
FROM node:14-slim
RUN apt-get update && apt-get upgrade -y
# Set ENV
ENV NODE_ENV=production DB_HOST=item-db
WORKDIR /app
# Copy package*.json first to check for changes, else cache
COPY package*.json .
RUN npm install --production --unsafe-perm
# Copy all after installing if there is source code change, else cache
COPY . .
RUN npm run build
EXPOSE 8080
CMD [ "npm", "start" ]
