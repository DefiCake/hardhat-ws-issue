FROM node:14.17

# Create app directory

WORKDIR /app

ARG NPM_TOKEN
COPY package*.json ./

RUN npm install

COPY . .

CMD ["npx", "hardhat", "node"]