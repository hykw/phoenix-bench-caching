defmodule Bench.AgentProc do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def get_data() do
    GenServer.call(__MODULE__, :get_data)
  end


  ##################################################

  def init(%{}) do
    {:ok, agent} = Agent.start_link(fn -> String.duplicate("あいうえおかきくけこ", 10_000) end, name: :agent)
  end


  def handle_call(:get_data, _from, state) do
    data = Agent.get(state, &(&1))
    {:reply, data, state}
  end

end
