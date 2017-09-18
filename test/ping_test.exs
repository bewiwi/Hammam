defmodule HammamTest.Check.Ping do
  use ExUnit.Case
  import Mock
  doctest Hammam.Check.Ping

  defmacro with_ping_mock(block) do
    quote do
      with_mock :gen_icmp, [ping: fn(addr) -> PingMock.ping(addr) end] do
        unquote(block)
      end
    end
  end

  test "test ping" do 
    with_ping_mock do
      assert Hammam.Check.Ping.start('localhost') == %{elapsed: 64}
    end
  end

end


