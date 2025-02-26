defmodule ExampleElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :example_elixir,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ExampleElixir, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.3"},
      {:plug_cowboy, "~> 2.5"},
      {:split, "~> 1.0.0", hex: :split_thin_sdk}
    ]
  end
end
