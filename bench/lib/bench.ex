defmodule Bench do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(Bench.Repo, []),
      # Start the endpoint when the application starts
      supervisor(Bench.Endpoint, []),
      # Start your own worker by calling: Bench.Worker.start_link(arg1, arg2, arg3)
      # worker(Bench.Worker, [arg1, arg2, arg3]),
      worker(Bench.AgentProc, []),
      worker(Bench.ETSProc, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bench.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Bench.Endpoint.config_change(changed, removed)
    :ok
  end
end
