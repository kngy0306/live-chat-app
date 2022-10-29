# live-chat-app

Vue.js + Ruby on Railsを使用したリアルタイムチャットアプリ。

## 画面構成

- ログイン画面
  - 必要項目の入力、認証
  - 「はじめての方はこちらをクリック」でサインアップ画面を表示
- サインアップ画面
  - 必要項目の入力、認証
  - 「アカウントをお持ちの方はこちらをクリック」でログイン画面を表示
- チャット画面
  - メッセージ一覧表示
  - メッセージ作成
  - いいね機能
  - いいね取り消し

## リアルタイムチャット機能の実装

**Action Cable**を使用する

[Action Cable の概要](https://railsguides.jp/action_cable_overview.html)

HTTP通信は1リクエスト、1レスポンスで接続がいったん終わる。そのためリアルタイムの通信、双方向通信には向いていない。  
そのためWebSocket通信を用いる。ブラウザとサーバ間でコネクションを確立する。一度コネクションを確立すると同じコネクション中で通信を行うため通信量が削減される。
