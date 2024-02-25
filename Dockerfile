## Use node image version 14
FROM node:14
WORKDIR /app
# Copy all
COPY . .
# Set ENV
ENV NODE_ENV=production DB_HOST=item-db
# Copy package*.json first to check for changes, else cache
RUN npm install --production --unsafe-perm && npm run build
EXPOSE 8080
CMD [ "npm", "start" ]
