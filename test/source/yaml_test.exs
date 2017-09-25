defmodule HammamTest.Source.Yaml do
  use ExUnit.Case

  test "test simple schedule" do
    case Hammam.Source.Yaml.load_file("test/asserts/test-schedule.yml") do
      {:ok,_ } -> assert true
      _ -> assert false, "Wrong value"
    end
  end

  test "test wrong file" do
    case Hammam.Source.Yaml.load_file("test/asserts/nofound-schedule.yml") do
      {:error,_ } -> assert true
      _ -> assert false, "Wrong value"
    end
  end

  test "test bad yaml file" do
    case Hammam.Source.Yaml.load_file("test/asserts/test-schedule-bad-yaml.yml") do
      {:error,_ } -> assert true
      _ -> assert false, "Wrong value"
    end
  end

  test "test map to source" do
    expected = [%Hammam.Job{
      id: :t_name,
      type: "ping",
      schedule: "* * * * *",
      conf: %{
        addr: "127.0.0.1"
      }
    }]

    data = Hammam.Source.Yaml.maps_to_source(%{
      "t_name": %{
        "type": "ping",
        "schedule": "* * * * *",
        "conf": %{
          "addr": "127.0.0.1"
        }
      }
    })
    assert data == expected
  end

end
