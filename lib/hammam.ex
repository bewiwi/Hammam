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

#    Hammam.Scheduler.new_job()
#      |> Quantum.Job.set_name(:wesh)
#      |> Quantum.Job.set_schedule(Crontab.CronExpression.Parser.parse!("* * * * * *", true))
#      |> Quantum.Job.set_task(fn -> IO.puts "COUCOU--BISSS" end)
#      |> Hammam.Scheduler.add_job()
# 

    process
  end
end
