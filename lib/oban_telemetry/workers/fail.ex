defmodule ObanTelemetry.Workers.Fail do
  use Oban.Worker, queue: :default

  require Logger

  def perform(_job) do
    {:error, :something}
  end
end
