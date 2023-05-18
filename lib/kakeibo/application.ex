defmodule Kakeibo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      KakeiboWeb.Telemetry,
      # Start the Ecto repository
      Kakeibo.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Kakeibo.PubSub},
      # Start the Endpoint (http/https)
      KakeiboWeb.Endpoint
      # Start a worker by calling: Kakeibo.Worker.start_link(arg)
      # {Kakeibo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kakeibo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KakeiboWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
