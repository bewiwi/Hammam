defmodule Hammam.Job do
  defstruct [:id, :schedule, :type, :conf]
end

defmodule Hammam.Source do
  @callback get_jobs() :: map
  def sync_schedule do
    :ok
  end

  def get_source do
    case Application.get_env(:hammam, :source_type) do
      "yaml" -> {:ok, Hammam.Source.Yaml}
      _ -> {:error, "Backend not found"}
    end
  
  end
end
