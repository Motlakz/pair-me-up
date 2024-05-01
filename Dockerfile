# Use the official Node.js image as the base image
FROM node:21.7.1

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application code to the working directory
COPY . .

# Build the Next.js application
RUN npm run build

# Expose the port on which the application will run (default is 3000)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]