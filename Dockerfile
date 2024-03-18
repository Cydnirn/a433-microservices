FROM node:18-bookworm-slim

#Expose port 3001
ENV PORT 3001

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
