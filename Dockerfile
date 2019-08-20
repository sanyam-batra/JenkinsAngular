FROM node:6.10.2-alpine
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app/package.json
RUN ["npm", "install"]
RUN npm install forever -g
npm i nohup -g
COPY . /app
EXPOSE 4200/tcp
CMD ["forever", "npm", "start","/app", "--", "--host", "0.0.0.0", "--poll", "500"]
