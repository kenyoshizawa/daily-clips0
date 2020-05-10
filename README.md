# 概要
youtube clips（URL：https://youtube-clips.herokuapp.com ）
はyoutube動画を共有し、コメントし合えるアプリです。既存のyoutubeコメントとの違いは、ユーザ同士のコミュニケーションを重視している点です。
自分の好きな動画をきっかけにコミュニケーションを生み出すことを目的としています。

![ポートフォリオ](https://user-images.githubusercontent.com/59391263/81496377-4d02ee00-92f2-11ea-94d4-3eedcc44fb1e.png)

# 機能一覧

* 新規ユーザ登録
* ログイン/ログアウト
* プロフィール編集（ユーザ名、プロフィール画像）
* Room作成（Room名、youtubeURL貼り付け）
* リアルタイムチャット（action cable)
* Room一覧表示


# 使用技術一覧

* 言語
Ruby（2.6.3）
* フレームワーク
Ruby on Rails（5.2.3）
* DB
MySQL（5.7）
* フロントエンド

jQuery
* 開発環境
Docker for Mac
Atom
* 本番環境
heroku
* 使用した主なgem
aws-sdk-s3（S3のストレージ使用）

Active Storage（画像アップロード）

