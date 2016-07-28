defmodule Bench.Cache do
  use Bench.Web, :model

  alias Bench.{
    Repo,
    Cache,
  }

  schema "cache" do
    field :code, :integer
    field :str, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:code, :str])
    |> validate_required([:code, :str])
  end


  def get_record(code) do
    query = Cache
            |> where([c], c.code == ^code)

    case Repo.one(query) do
      record -> record.str
    end
  end
end
