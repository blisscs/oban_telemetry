defmodule ObanTelemetry.Workers.Success do
  use Oban.Worker, queue: :default

  require Logger

  def perform(_job) do
    :ok
  end
end
