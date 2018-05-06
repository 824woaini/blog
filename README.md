# nslifestyle.com

## 作業を始める前に・・・

```sh
cd ブログがあるパス
git pull origin master
```

## ローカルで動かしてみる

```sh
cd blog
hugo serve -D
```

## ブログ記事作成

```sh
cd blog
hugo new posts/post-name.md
```

## アップロード

```sh
./scripts/deploy_prod.sh
```

