defmodule Hammam.Scheduler do
  use Quantum.Scheduler, otp_app: :hammam
  @callback schedule() :: map
end

defmodule Hammam.Scheduler.Yaml do
  use Application, otp_app: :scheduler_yaml
  @behaviour Hammam.Scheduler

  def schedule() do
    file = Application.get_env(:scheduler_yaml, :schedule_file)
    YamlElixir.read_from_file file
  end
end
