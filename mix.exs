defmodule ExChangerate.MixProject do
  @moduledoc false
  use Mix.Project

  def project do
    [
      app: :ex_changerate,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison],
      env: [api_instance: "https://api.exchangerate.host"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:httpoison, "~> 1.6"},
      {:poison, "~> 4.0"},
      {:ex_doc, "~> 0.22", only: :dev, runtime: false},
      {:inch_ex, "~> 2.0", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end
end
