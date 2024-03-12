## 概要

lambda用ローカル開発環境（ランタイム Node.js 20）

Dockerfileのイメージタグを指定することで、他のランタイムにも対応可能。

## 構築方法

### 完全初回時の構築（`hello_world_function/node/app/package.json`無し）

1. 本リポジトリにはpackage.jsonが含まれていない（npm initが行われる前の状態）、そのため下記を実行してpackage.jsonを作成する。

    ```
    cd hello_world_function/node/app
    docker run --rm -it -v $(pwd):/usr/src/app node:Dockerfileで指定されているnode.jsコンテナのタグ /bin/sh -c "cd /usr/src/app && npm init -y"
    make init
    ```

### 継続開発時の構築（`hello_world_function/node/app/package.json`有り）

1. package.jsonはすでに作成されているが、はじめて環境を構築する人は下記を実行する。

    ```
    make init
    ```

## 運用時に利用するコマンド

### Dockerfileに修正を加えたので再構築したいとき

1. 下記を実行してコンテナを再構築する。

    ```
    make build
    ```

### コンテナの起動

1. 下記を実行してコンテナを起動する。

    ```
    make up
    ```

### コンテナの停止

1. 下記を実行してコンテナを停止する。

    ```
    make down
    ```

### npm installを実行したいとき

1. 下記を実行してnpm installだけをを実行する。

    ```
    make npm.install
    ```

### npmを使ってパッケージをインストールしたいとき

1. 下記を実行してnpm installを使って指定パッケージをインストールする。

    ```
    make npm.install PACKAGE=パッケージ名
    ```

### コード郡をzip化したいとき

1. 下記を実行してコード郡をzip化する。

    ```
    make export_zip
    ```

## 使い方

下記を実施することでレイヤーを指定する事なく、パッケージ込のzipを作成することができる。

1. `hello_world_function/node/app/index.mjs`にLambda関数のコードを記述する。
1. 必要に応じてパッケージをインストールする。
1. `make export_zip`を実行してコード郡をzip化する。
1. `hello_world_function/node/app/`直下にfunction.zipが出力されていることをを確認する。
1. `function.zip`をLambdaにアップロードする。