defmodule Bench.CacheTest do
  use Bench.ModelCase

  alias Bench.Cache

  @valid_attrs %{code: 42, str: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Cache.changeset(%Cache{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Cache.changeset(%Cache{}, @invalid_attrs)
    refute changeset.valid?
  end
end
