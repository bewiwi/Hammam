defmodule Hammam.CheckSource do
  @callback get_jobs() :: map

  defp get_source do
    case Application.get_env(:hammam, :source_type) do
      "yaml" -> {:ok, Hammam.CheckSource.Yaml}
      _ -> {:error, "Backend not found"}
    end
  end

  def get_all_jobs do
    {:ok, source} = get_source()
    {:ok, jobs} = source.get_jobs()
  end

end
