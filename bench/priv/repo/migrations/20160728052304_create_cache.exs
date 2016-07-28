defmodule Bench.Repo.Migrations.CreateCache do
  use Ecto.Migration

  def change do
    create table(:cache) do
      add :code, :integer, null: false
      add :str, :string, null: false, default: ""

      timestamps()
    end

    create index(:cache, [:code], unique: true, concurrently: false)

  end
end
