defmodule Hammam.Metric.Stdout do
  @behaviour Hammam.Metric

  def send(check) do
    IO.puts "#{check.job_id} #{check.type} #{inspect check.metrics}"
  end
end
