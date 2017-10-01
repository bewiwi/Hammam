defmodule Hammam.Metric do
  @callback send(Hammam.Check)::  {:ok} | {:error, String.t}

  defp get_backend do
    case Application.get_env(:hammam, :metric_type) do
      "stdout" -> {:ok, Hammam.Metric.Stdout}
      _ -> {:error, "Backend not found"}
    end

  end

  def send(check) do
    case get_backend() do
      {:ok, backend} -> backend.send(check)
      {:error, reason} -> {:error, reason}
    end
  end
end
