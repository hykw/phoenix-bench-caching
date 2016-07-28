# phoenix-bench-caching
Ecto/Agent/ETSの速度差比較

## 前準備

- Phoenix のプロジェクトを作成
  - `mix phoenix.new bench --no-brunch --database mysql`

- MySQLで下記テーブルを作成
  - テーブル名：phoenix_bench
  - userid: testuser
  - password: passwd

- config/dev.exs に DB の設定、ポートは5000に変更
- `mix ecto.create`
- 動作確認
-- `mix phoenix.server`

## ベンチする内容

Agent/ETS には、起動時に Ecto からデータを読み込んでセットする

- 素のトップページ
- Ectoからデータを読み込んで、テンプレートにセット
- プロセス経由でAgentにあるデータを読み込んで、テンプレートにセット
  - Agentに直接アクセスして、テンプレートにセット
- プロセス経由でETSにあるデータを読み込んで、テンプレートにセット
  - ETSに直接アクセスして、テンプレートにセット
