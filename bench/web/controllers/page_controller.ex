defmodule Bench.PageController do
  use Bench.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
