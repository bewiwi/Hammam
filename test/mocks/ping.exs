defmodule PingMock do
  def ping(addr) do
    [ successful_ping(addr) ]
  end

  defp successful_ping(_) do
    {
      :ok, 'localhost', {127, 0, 0, 1}, {127, 0, 0, 1},
      {21756, 0, 64, 22},
      " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJK"
    }

  end
end
