defmodule Psglx.MixProject do
  use Mix.Project

  def project do
    [
      app: :psglx,
      version: "1.1.0",
      description: "Functional bot that handles fun and activities within your Discord server",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Psglx.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dotenv_parser, "~> 2.0"},
      {:nostrum, "~> 0.6.0"}
    ]
  end
end
