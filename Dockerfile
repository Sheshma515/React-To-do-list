# Build environment
FROM node:14 AS builder
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Set the environment path for npm binaries
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# Copy package.json and install dependencies
COPY package.json /usr/src/app/package.json
RUN npm install --silent

# Install react-scripts globally
RUN npm install react-scripts@1.1.1 -g --silent

# Copy the rest of the application code
COPY . /usr/src/app

# Build the React application
RUN npm run build

# Note: This Dockerfile will not serve the application.
# You can run the build output located in /usr/src/app/build locally or in another server.
