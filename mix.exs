defmodule Hammam.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hammam,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Hammam.Application, []},
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:gen_icmp, github: 'msantos/gen_icmp', app: false},
      {:quantum, ">= 2.1.0"},
      {:timex, "~> 3.0"},
      {:yaml_elixir, "~> 1.3.1"},
      {:mock, "~> 0.2.0", only: :test}
    ]
  end
end
