FROM node:6.10.2-alpine
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app/package.json
RUN ["npm", "install"]
RUN npm install forever -g
COPY . /app
EXPOSE 4200/tcp
CMD ["forever", "npm", "start","/var/jenkins_home/workspace/Jenkins_Angular/src/app ", "--", "--host", "0.0.0.0", "--poll", "500"]
