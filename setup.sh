#!/bin/bash

# Dockerコンテナの名前
CONTAINER_NAME=mariadb

# コンテナが存在するかチェック
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    # コンテナが存在する場合
    if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
        # コンテナが実行中の場合
        echo "コンテナ '$CONTAINER_NAME' がすでに実行中です。コンテナにログインします。"
        docker exec -it $CONTAINER_NAME bash -c "mariadb -u root -ppassword"
    else
        # コンテナが存在するが停止している場合
        echo "コンテナ '$CONTAINER_NAME' は存在しますが、停止しています。コンテナを再起動します。"
        docker start $CONTAINER_NAME
        # コンテナが起動するのを待つ（数秒待つ）
        sleep 5
        docker exec -it $CONTAINER_NAME bash -c "mariadb -u root -ppassword"
    fi
else
    # コンテナが存在しない場合
    echo "コンテナ '$CONTAINER_NAME' が存在しません。新しいコンテナを作成して起動します。"
    # Docker imageの作成
    docker build -t mariadb .

    # Docker containerの起動
    docker run --name $CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=password -dp 3306:3306 mariadb

    # コンテナ内に入る
    docker exec -it $CONTAINER_NAME bash -c "mariadb -u root -ppassword"
fi
