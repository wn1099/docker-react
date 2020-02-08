# Multi phase docker file
FROM node:alpine as builder
# Working directory
WORKDIR '/app'
# Copy package file
COPY package.json .

# All dependency
RUN npm install
COPY . .
# Generate production arteifacts
RUN npm run build 


FROM nginx
COPY --from=builder /app/build ./usr/share/nginx/html