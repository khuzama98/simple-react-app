#this file for production environment


#BUILD PHASE
FROM node:alpine as Builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


#RUN PHASE

FROM nginx

COPY --from=Builder /app/build /usr/share/nginx/html