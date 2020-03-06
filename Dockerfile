# Building Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <- all the stuff
# FROM statement here terminal the above phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# nginx will run by its default command