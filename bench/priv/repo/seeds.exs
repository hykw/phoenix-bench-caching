# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bench.Repo.insert!(%Bench.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

param = %Bench.Cache {
  code: 100,
  str: String.duplicate("あいうえおかきくけこ", 10000),
}
Bench.Repo.insert!(param)
