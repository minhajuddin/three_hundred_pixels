defmodule ThreeHundredPixels.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ThreeHundredPixelsWeb.Telemetry,
      # Start the Ecto repository
      ThreeHundredPixels.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ThreeHundredPixels.PubSub},
      # Start Finch
      {Finch, name: ThreeHundredPixels.Finch},
      # Start the Endpoint (http/https)
      ThreeHundredPixelsWeb.Endpoint
      # Start a worker by calling: ThreeHundredPixels.Worker.start_link(arg)
      # {ThreeHundredPixels.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ThreeHundredPixels.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ThreeHundredPixelsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
