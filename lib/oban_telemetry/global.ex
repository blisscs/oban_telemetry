defmodule ObanTelemetry.Global do
  @moduledoc false

  require Logger

  use Supervisor

  def start_link(_init_args) do
    case Supervisor.start_link(__MODULE__, nil, name: {:global, __MODULE__}) do
      {:ok, pid} ->
        {:ok, pid}

      {:error, {:already_started, pid}} ->
        Process.link(pid)
        {:ok, pid}

      _ ->
        :ignore
    end
  end

  def init(_init_arg) do
    :ok =
      :telemetry.attach_many(
        "oban-telemetry-handler",
        [
          [:oban, :engine, :complete_job, :stop],
          [:oban, :engine, :cancel_job, :stop],
          [:oban, :engine, :discard_job, :stop]
        ],
        &ObanTelemetry.Global.handle_event/4,
        nil
      )

    children = []

    Supervisor.init(children, strategy: :one_for_one)
  end

  def handle_event([:oban, :engine, :complete_job, :stop], _, metadata, _) do
    IO.inspect(metadata, label: "complete")
  end

  def handle_event([:oban, :engine, _, :stop], _, metadata, _) do
    IO.inspect(metadata, label: "fail")
  end
end
