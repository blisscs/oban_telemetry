import Config

config :oban_telemetry, ObanTelemetry.Repo, pool: Ecto.Adapters.SQL.Sandbox

config :oban_telemetry, Oban, queues: false, plugins: false
