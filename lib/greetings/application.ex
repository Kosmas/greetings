defmodule Greetings.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    greeting = System.get_env("GREETING") || "Hello"

    children = [
      # Starts a worker by calling: Greetings.Worker.start_link(arg)
      {Greetings, [%{greeting: greeting}, [port: 8080]]},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Greetings.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
