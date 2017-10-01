defmodule Hammam.Check do
  @callback start(String.t) :: map
  defstruct [:job_id, :type, :metrics]
end
