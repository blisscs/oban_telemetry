import Config

config :oban_telemetry, ecto_repos: [ObanTelemetry.Repo]

config :oban_telemetry, ObanTelemetry.Repo,
  username: System.get_env("OBAN_TELEMETRY_DB_USERNAME"),
  password: System.get_env("OBAN_TELEMETRY_DB_PASSWORD"),
  database: "oban_telemetry_#{config_env()}",
  host_name: "localhost"

import_config "#{config_env()}.exs"
