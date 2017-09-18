defmodule Hammam.Check do
  @callback start(String.t) :: map
  defstruct [:type, :metrics]
end
