defmodule ObanTelemetry.Case do
  use ExUnit.CaseTemplate

  using do
    quote do
      import ObanTelemetry.Case
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ObanTelemetry.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(ObanTelemetry.Repo, {:shared, self()})
    end

    :ok
  end
end
