defmodule Accessible.Mixfile do
  use Mix.Project

  @version "0.3.0"

  def project do
    [
      app: :accessible,
      deps: deps(),
      description: description(),
      docs: [
        main: "readme",
        extras: [
          "README.md"
        ]
      ],
      elixir: "~> 1.4",
      elixirc_options: [warnings_as_errors: true],
      elixirc_paths: elixirc_paths(Mix.env()),
      name: "Accessible",
      package: package(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      source_url: "https://github.com/codedge-llc/accessible",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      version: @version
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.0", only: [:dev, :test], runtime: false},
      {:earmark, "~> 1.0", only: :dev},
      {:excoveralls, "~> 0.5", only: :test},
      {:ex_doc, "~> 0.2", only: :dev}
    ]
  end

  defp description do
    """
    Dead-simple Access behaviour for custom structs
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/codedge-llc/accessible"},
      maintainers: ["Henry Popp"]
    ]
  end
end
