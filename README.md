# Mariadb

## データベースサーバーの構築

docker imageの作成
```
$ docker build -t mariadb .
```

docker container の起動
```
$ docker run --name mariadb -e MYSQL_ROOT_PASSWORD=password -dp 3306:3306 mariadb
```

## Mariadbにlogin

コンテナ内に入る
```
docker exec -it mariadb bash
```

ログイン
```
mariadb -u root -ppassword
```