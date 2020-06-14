FROM node:10-alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
#This will not work for integration with Travis CI and AWS EBS instead you need to right RUN command
#CMD ["npm","run","build"]
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html


