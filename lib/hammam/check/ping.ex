defmodule Hammam.Check.Ping do
  @behaviour Hammam.Check
  @moduledoc """
  Ping
  """

  def start(addr) do
    # Ping and get first result (only 1 host) 
    [result|_] =  :gen_icmp.ping(addr)
    case result do
      {:ok,_,_,_, detail,_} -> %{
        "elapsed": elem(detail, 2)
      }
      _ -> {:error, "Undetermined reason"}
    end
  end
end
