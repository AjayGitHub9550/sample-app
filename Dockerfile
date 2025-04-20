FROM node:23-alpine
WORKDIR /app
COPY app/package.json app/yarn.lock ./
RUN yarn install --production
COPY app/ .
CMD ["node", "src/index.js"]
