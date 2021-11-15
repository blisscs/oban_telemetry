defmodule ObanTelemetry.Repo do
  use Ecto.Repo,
    otp_app: :oban_telemetry,
    adapter: Ecto.Adapters.Postgres
end
