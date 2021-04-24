defmodule Inmana.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Inmana.Repo,
      InmanaWeb.Telemetry,
      {Phoenix.PubSub, name: Inmana.PubSub},
      InmanaWeb.Endpoint,
      Inmana.Supplies.Scheduler
    ]

    opts = [strategy: :one_for_one, name: Inmana.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    InmanaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
