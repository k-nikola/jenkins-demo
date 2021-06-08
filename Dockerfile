#Base docker image to create app image
FROM nginx:alpine

#Copying the site files into nginx html dir
ADD site/. /usr/share/nginx/html

