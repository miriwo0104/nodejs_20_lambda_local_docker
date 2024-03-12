FROM node:20-alpine3.19

ENV TZ=Asia/Tokyo

# zipコマンドをインストール
RUN apk add --no-cache zip

# アプリケーションディレクトリを作成
WORKDIR /usr/src/app

COPY app/ ./
RUN npm install

CMD ["sh", "-c", "while :; do sleep 1000; done"]