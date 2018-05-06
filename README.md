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

## コマンド使い方

### cd: フォルダ移動

```sh
cd Development
```

### ls: 現在のパスのファイル一覧

```sh
ls
```

### git: 何か変更したら（記事作成、編集など）

```sh
git add -A
git commit -m '変えた内容'
git push origin master
```

