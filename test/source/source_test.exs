defmodule HammamTest.Source do
  use ExUnit.Case
  doctest Hammam.Source

  test "test load yaml source" do
    assert Hammam.Source.get_source() == {:ok,  Hammam.Source.Yaml}
  end
  
end
