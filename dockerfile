FROM node:20-bookworm

WORKDIR /app

COPY package.json ./

RUN npm install

RUN npx -y playwright@1.48.1 install --with-deps chromium

COPY . .

EXPOSE 8080

CMD ["npx", "playwright", "test", "--ui-port=8080", "--ui-host=0.0.0.0"]