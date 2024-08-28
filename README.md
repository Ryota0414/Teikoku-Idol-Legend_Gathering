# 帝国アイドルレジェンドプロデューサーの集い

## サイト概要
### サイトテーマ
​帝国アイドルレジェンドユーザーの攻略情報共有をするためのコミュニティサイト
### テーマを選んだ理由
​もともとゲームが好きで、どうすればうまくいくのか攻略することが多いのですが、自分一人では攻略するのが難しい場面が多々ありました。</br>
 なので攻略情報を調べましたが、攻略とは関係ない情報と混ざっていて見つけるのが大変だったので、攻略情報を共有しあうサービスがあると便利だと考えました。</br>
 このサービスがあることで、ゲームの上級者だけでなく、初心者や中級者が攻略情報参考にできたり、アドバイスをもらえる場にもなると考え、このテーマにしました。
### ターゲットユーザー
- ゲームの攻略情報を共有したい人
- ゲームの攻略情報を知りたい人
- ゲームのアドバイスをもらいたい人
### 主な利用シーン
- 攻略したい内容を絞り込んで攻略情報を調べる時
- 自分の持っている攻略情報を投稿する時
## 設計書
![スクリーンショット 2024-08-28 204153](https://github.com/user-attachments/assets/4910b6bc-51e3-4e71-bac3-2115bc0abef6)
![スクリーンショット 2024-08-28 205852](https://github.com/user-attachments/assets/0a62d8e2-44b4-42d8-a4b2-093ea0388b1a)
![スクリーンショット 2024-08-28 210003](https://github.com/user-attachments/assets/4e948990-f04b-4ded-ab62-d8f1ea5b9554)
[アプリケーション詳細設計書](https://docs.google.com/spreadsheets/d/1s6hBdbMJwd4LYhYi8t6GZpihsVFP9Gv0v0ISx79IIj4/edit?usp=sharing)
- 使用したgem
- rails - ウェブアプリケーションフレームワーク
- sqlite3 - デフォルトのデータベース
- puma - アプリケーションサーバー
- sass-rails - スタイルシート用のSCSSをサポート
- webpacker - JavaScriptのトランスパイル
- turbolinks - ページ間のナビゲーションを高速化
- jbuilder - JSON APIの構築
- image_processing - Active Storageで画像を処理
- mini_magick - ImageMagickのラッパーとして画像を処理
- bootsnap - 起動時間の短縮
- kaminari - ページネーションのサポート
- devise - ユーザー認証
- dotenv-rails - 環境変数の管理
- mysql2 - プロダクション用データベース(MySQL)接続
- tzinfo-data - Windows環境向けのタイムゾーン情報
- net-smtp - SMTPプロトコルのサポート
- net-pop - POPプロトコルのサポート
- net-imap - IMAPプロトコルのサポート
## 実装機能
- エンドユーザー
  - 会員登録・退会
  - 投稿機能・投稿削除
  - コメント・コメント返信・コメント削除
  - 投稿閲覧・投稿絞り込み表示
  - ユーザー・投稿検索
  - ゲストログイン
 - 管理者
   - ジャンル登録・編集・削除
   - エンドユーザーの退会・有効
   - エンドユーザーの投稿・コメントの削除
<br>
管理者機能は管理者ログインページより<br>
メールアドレス：teikoku@gmail.com<br>
パスワード：teikoku0414<br>
を入力してログインしてください。

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
​
## 使用素材
- フリーイラスト素材として以下を使用
    - いらすとや(https://www.irasutoya.com/)

- 著作権を考慮し、架空のデータを扱う予定です。</br>
  なお今後、実在するデータを利用する際には、事前に著作権保持者と契約を結んだ上で利用します。
