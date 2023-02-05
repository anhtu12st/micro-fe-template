# # Use an official Nginx image as the base image
# FROM nginx:1.23-alpine

# # Copy the built SPA files to the Nginx HTML directory
# COPY dist /usr/share/nginx/html

# # Copy the Nginx configuration file to the container
# COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf

# Use a Node.js base image
FROM node:14-alpine as builder

# Create a directory for the React project
WORKDIR /app

# Copy the package.json file and install dependencies
COPY package.json .
RUN yarn

# Copy the rest of the React project files
COPY . .

# Build the React project
RUN yarn build

## After project is built we copy dist folder to nginx to serve 

# Use an official Nginx image as the base image
FROM nginx:1.23-alpine

# Copy the built SPA files to the Nginx HTML directory
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy the Nginx configuration file to the container
COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf
