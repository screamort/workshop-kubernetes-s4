# Build
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .

# Runtime
FROM node:20-alpine
RUN addgroup -S app && adduser -S -G app app
WORKDIR /app
COPY --from=build /app /app
USER app
EXPOSE 3000
CMD ["node", "index.js"]
