##Stage 1: Build
FROM node:14-alpine As builder

# Install packages
WORKDIR /home/node
COPY package*.json /home/node/
COPY ./ /home/node/
RUN npm ci

# build
COPY ./ /home/node/
RUN npm run build

##Stage 2: Run 
FROM nginx:alpine As serve-env

COPY --from=builder /home/node/dist/cc-challenge /usr/share/nginx/html

COPY nginx/default.conf /etc/nginx/conf.d/nginx.template
CMD /bin/sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/nginx.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
