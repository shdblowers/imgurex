defmodule Imgurex.Mixfile do
  use Mix.Project

  def project do
    [app: :imgurex,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     aliases: aliases(),
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coverall.travis": :test]]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [{:httpoison, "~> 0.10"},
     {:poison, "~> 3.0"},
     {:excoveralls, "~> 0.5", only: :test},
     {:credo, "~> 0.6", only: [:dev, :test]},
     {:exvcr, "~> 0.8.7", only: :test}]
  end

   defp aliases do
  end
end
