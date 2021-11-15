defmodule ObanTelemetry.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      ObanTelemetry.Repo,
      {Oban, oban_config()}
    ]

    opts = [strategy: :one_for_one, name: ObanTelemetry.Application]

    Supervisor.start_link(children, opts)
  end

  defp oban_config() do
    Application.fetch_env!(:oban_telemetry, Oban)
  end
end
