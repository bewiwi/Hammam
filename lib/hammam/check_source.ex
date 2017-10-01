defmodule Hammam.CheckSource do
  @callback get_jobs() ::  {:ok, map} | {:error, String.t}

  defp get_backend do
    case Application.get_env(:hammam, :source_type) do
      "yaml" -> {:ok, Hammam.CheckSource.Yaml}
      _ -> {:error, "Backend not found"}
    end
  end

  def get_all_jobs do
    {:ok, source} = get_backend()
    source.get_jobs()
  end

end
