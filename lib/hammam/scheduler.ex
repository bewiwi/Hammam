defmodule Hammam.Scheduler do
  require Logger
  use Quantum.Scheduler, otp_app: :hammam
 
  def run_schedule do
    {:ok, jobs} = Hammam.CheckSource.get_all_jobs()
    Enum.each(jobs, fn(j) -> Hammam.Scheduler.schedule_job(j) end)
    :ok
  end
 
  def schedule_job(job) do
    Logger.info  "Schedule Job: #{job.id}"
    Hammam.Scheduler.new_job()
      |> Quantum.Job.set_schedule(Crontab.CronExpression.Parser.parse!(job.schedule, true))
      |> Quantum.Job.set_task(fn -> job_task(job) end)
      |> Hammam.Scheduler.add_job()
  end

  def job_task(job) do
    {:ok, metrics} = Hammam.Job.run(job)
    check = %Hammam.Check{
      type: job.type,
      metrics: metrics,
      job_id: job.id
    }
    Hammam.Metric.send(check)
  end
end
