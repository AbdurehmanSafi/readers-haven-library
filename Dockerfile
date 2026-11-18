
# Stage 1: Build the website using Node.js and Parcel
FROM node:22-alpine AS builder

# Set the working directory inside the builder container
WORKDIR /app

# Copy package files first to improve Docker layer caching
COPY package*.json ./

# Install exact dependencies from package-lock.json
RUN npm ci

# Copy website HTML files
COPY src/ ./src/

# Copy shared CSS styles
COPY styles/ ./styles/

# Build all static website pages into the dist folder
RUN npm run build


# Stage 2: Serve the website using lightweight Nginx
FROM nginx:1.27-alpine

# Copy only the generated website from the builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Document that the website uses port 80
EXPOSE 80

# Keep Nginx running in the foreground
CMD ["nginx", "-g", "daemon off;"]
