defmodule Bench.Router do
  use Bench.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Bench do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/2", PageController, :index2

    get "/ecto", PageController, :ecto
    get "/agent", PageController, :agent
    get "/agent_direct", PageController, :agent_direct
    get "/ets", PageController, :ets
    get "/ets_direct", PageController, :ets_direct
  end

  # Other scopes may use custom stacks.
  # scope "/api", Bench do
  #   pipe_through :api
  # end
end
