#Build Phase

FROM node:alpine 

WORKDIR '/app'

COPY package*.json ./

RUN npm install

COPY . . 
#no need for volumes here bcz in production environment we
#do not need to change the code at all. So copy whole code to the container.

RUN npm run build 


#Run Phase

FROM nginx
EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html
