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

- model とテストの準備
  - `mix phoenix.gen.model Cache cache code:integer str:string`
  - `vi priv/repo/migrations/20160728052304_create_cache.exs`
  - `mix ecto.migrate`
  - `vi priv/repo/seeds.exs`
  - `mix run priv/repo/seeds.exs`


## ベンチする内容

Agent/ETS には、起動時に Ecto からデータを読み込んでセットする

- /: 素のトップページ
- /ecto: Ectoからデータを読み込んで、テンプレートにセット
- /agent: プロセス経由でAgentにあるデータを読み込んで、テンプレートにセット
  - /agent_direct: Agentに直接アクセスして、テンプレートにセット
- /ets: プロセス経由でETSにあるデータを読み込んで、テンプレートにセット
  - /etc_direct: ETSに直接アクセスして、テンプレートにセット

## ベンチ方法
ab でいいや

