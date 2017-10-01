defmodule Hammam.Check.Ping do
  require Logger
  @behaviour Hammam.Check
  @moduledoc """
  Ping
  """

  def start(conf) do
    addr = to_charlist conf["addr"]
    Logger.debug("Ping #{addr}")
    # Ping and get first result (only 1 host)
    run_ping(addr)
   end

  defp run_ping(addr) do
    case  :gen_icmp.ping(addr) do
      {:error, reason} -> {:error, reason}
      [result|_] ->  case result do
          {:ok,_,_,_, detail,_} ->{:ok, %{
            "elapsed": elem(detail, 3),
          }}
          _ -> {:error, "Undetermined reason"}
        end
      _ -> {:error, "Wrong return type"}
    end
  end
end
