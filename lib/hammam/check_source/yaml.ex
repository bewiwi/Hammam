defmodule Hammam.CheckSource.Yaml do
  require Logger
  @behaviour Hammam.CheckSource
  
  def get_jobs() do
    case load_file() do
      {:ok, jobs_maps } -> {:ok, maps_to_source(jobs_maps)}
      {:error, reason} -> {:error, reason}
    end 
  end

  def maps_to_source(job_maps) do
    Enum.map(job_maps, fn {k, j_map} -> 
      %Hammam.Job{
        id: k,
        schedule: j_map["schedule"],
        type: j_map["type"],
        conf: j_map["conf"],
      }
     end)
  end

  def load_file(file \\ "scheduler.yml") do
    Logger.debug "[YAML] Try to open #{file}"
    try do
      {:ok,  YamlElixir.read_from_file(file)}
    catch
      {:yamerl_exception, reason} -> {:error, reason}
    end
  end
end
