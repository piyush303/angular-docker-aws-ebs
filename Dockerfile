FROM node:alpine as BUILD
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=BUILD /app/dist/docker-aws-ebs /usr/share/nginx/html