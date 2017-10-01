defmodule Hammam.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    IO.puts "Start APP"
    children = [
      # This is the new line
      worker(Hammam.Scheduler, [])
    ]

    opts = [strategy: :one_for_one, name: Hammam.Supervisor]
    process = Supervisor.start_link(children, opts)
    Hammam.Scheduler.run_schedule()
    process
  end
end
