defmodule Bench.ETSProc do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def get_data() do
    GenServer.call(__MODULE__, :get_data)
  end

  ##################################################
  @key "code"

  def init(%{}) do
    table = :ets.new(:ets, [:named_table])
    :ets.insert(table, {@key, String.duplicate("あいうえおかきくけこ", 10_000)})

    {:ok, table}
  end

  def handle_call(:get_data, _from, state) do
    [{@key, data}] = :ets.lookup(state, @key)
    {:reply, data, state}
  end

end
