## 概要

lambda用ローカル開発環境（ランタイム Node.js 20）

## 構築方法

### 完全初回構築（`hello_world_function/node/app/index.mjs`コード無し）

1. 下記を実行する。

    ```
    cd hello_world_function/node/app
    docker run --rm -it -v $(pwd):/usr/src/app node:20-alpine3.19 /bin/sh -c "cd /usr/src/app && npm init -y"
    make init
    ```

### 継続開発構築（`hello_world_function/node/app/index.mjs`コード有り）

1. 下記を実行する。

    ```
    make init
    ```