FROM node:18-alpine AS build
WORKDIR ./web-app/app
COPY ./web-app/package*.json ./
RUN npm install
COPY ./web-app .
RUN npm run build




FROM nginx:alpine
COPY --from=build ./web-app/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
