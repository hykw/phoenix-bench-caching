defmodule Bench.PageController do
  use Bench.Web, :controller

  alias Bench.{
    Cache,
  }

  @code 100
  @name_agent :agent
  @name_ets :ets
  @key_code "code"


  # renderのベンチをしたいわけじゃないので、trim
  defp truncate(str) do
    str
    |> String.slice(0, 5)
  end

  defp get_param(str) do
    %{ data: truncate(str) }
  end


  ##################################################

  def index(conn, _params) do
    param = get_param(String.duplicate("あいうえおかきくけこ", 10_000))
    render(conn, "index.html", param)
  end


  def ecto(conn, _) do
    param = get_param(Cache.get_record(@code))
    render(conn, "index.html", param)
  end


  def agent(conn, _) do
    param = get_param(Bench.AgentProc.get_data())
    render(conn, "index.html", param)
  end

  def agent_direct(conn, _) do
    param = get_param(Agent.get(@name_agent, &(&1)))
    render(conn, "index.html", param)
  end


  def ets(conn, _) do
    param = get_param(Bench.ETSProc.get_data())
    render(conn, "index.html", param)
  end

  def ets_direct(conn, _) do
    [{@key_code, data}] = :ets.lookup(@name_ets, @key_code)
    param = get_param(data)
    render(conn, "index.html", param)
  end

end
