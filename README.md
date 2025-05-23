# nagano-cake

インターンで作成した模擬ECサイトのアプリケーションです。

## 動作環境

* Ruby: 3.1.2
* Rails: 6.1.7.10
* Node.js: v16.x (v16.20.2で開発・動作確認済み)
* Yarn: 1.x (1.22.22で開発・動作確認済み)
* Database: SQLite3

## ローカルでのセットアップ手順

1.  **リポジトリをクローンする**
    ```bash
    git clone [https://github.com/hayase-m/nagano-cake.git]
    cd nagano-cake
    ```

2.  **必要なRubyのgemをインストールする**
    ```bash
    bundle install
    ```

3.  **JavaScriptの依存関係をインストールする**
    ```bash
    yarn install
    # もしyarnがインストールされていない場合は、先にNode.jsとYarnをインストールしてください。
    ```

4.  **データベースを作成・設定する**
    ```bash
    rails db:create
    rails db:migrate
    ```

5.  **(任意) 初期データを投入する**
    ```bash
    rails db:seed
    ```

6.  **ローカルサーバーを起動する**
    ```bash
    rails s
    ```

7.  ブラウザで `http://localhost:3000` にアクセスしてください。

## 主な使用技術

* Ruby 3.1.2
* Ruby on Rails 6.1.7.10
* Puma
* SQLite3
* Sass, Webpacker
* Devise
* Kaminari
