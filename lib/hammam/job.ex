defmodule Hammam.Job do
  require Logger
  defstruct [:id, :schedule, :type, :conf]

  def get_module(job_type) do
    case job_type do
      "ping" -> Hammam.Check.Ping
      _ -> nil
    end
  end

  def run(job) do
    Logger.debug("Run job #{job.id}")
    case get_module(job.type).start(job.conf) do
      {:ok, metrics} -> {:ok, metrics}
      {:error, message} -> Logger.error("Check #{job.id} fail : #{message}")
      _ -> Logger.error("Check wrong return format")
    end
  end
end
