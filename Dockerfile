FROM node:16.20.2

WORKDIR /app

# Copy only dependency files first (better cache)
COPY package*.json ./

RUN npm ci 

# Copy application source
COPY . .

EXPOSE 3001

CMD ["node", "server.js"]
