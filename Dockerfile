FROM node:18-bookworm-slim

#Expose port 3000
ENV PORT 3000

#Use not root user
USER node

#Create directory with user node
RUN mkdir /home/node/app

#Set workdir
WORKDIR /home/node/app

#Copy All files
COPY --chown=node:node . .

RUN npm install


#Runs erver
CMD [ "node", "index.js" ]
