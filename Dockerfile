FROM node:14.17 AS builder

# Create app directory
WORKDIR /app

COPY package*.json ./

RUN npm install -g typescript ts-node
RUN npm install

COPY . .

RUN npm run build

FROM node:14.17

WORKDIR /app

ENV NODE_ENV=production
COPY --from=builder /app/build .
COPY package*.json ./
RUN npm install --only=prod

ARG PROM_PORT=8080
EXPOSE $PROM_PORT

COPY scripts/docker-entrypoint.sh ./
COPY scripts/wait-for-it.sh ./
RUN chmod +x ./wait-for-it.sh ./docker-entrypoint.sh

ENTRYPOINT [ "./docker-entrypoint.sh" ]
CMD ["node", "app.js"]