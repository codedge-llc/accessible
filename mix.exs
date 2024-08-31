defmodule Accessible.Mixfile do
  use Mix.Project

  @source_url "https://github.com/codedge-llc/accessible"
  @version "0.3.0"

  def project do
    [
      app: :accessible,
      deps: deps(),
      dialyzer: dialyzer(),
      docs: docs(),
      elixir: "~> 1.13",
      elixirc_options: [warnings_as_errors: true],
      elixirc_paths: elixirc_paths(Mix.env()),
      name: "Accessible",
      package: package(),
      start_permanent: Mix.env() == :prod,
      test_coverage: test_coverage(),
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
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      api_reference: false,
      extras: [
        "CHANGELOG.md",
        LICENSE: [title: "License"],
        "README.md": [title: "Overview"]
      ],
      formatters: ["html"],
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url
    ]
  end

  defp dialyzer do
    [
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
    ]
  end

  defp package do
    [
      description: "Dead-simple Access behaviour for custom structs.",
      files: ["lib", "mix.exs", "README*", "LICENSE*", "CHANGELOG*"],
      licenses: ["MIT"],
      links: %{
        "Changelog" => "https://hexdocs.pm/accessible/changelog.html",
        "GitHub" => "https://github.com/codedge-llc/accessible",
        "Sponsor" => "https://github.com/sponsors/codedge-llc"
      },
      maintainers: ["Henry Popp"]
    ]
  end

  defp test_coverage do
    [
      ignore_modules: [
        Accessible.TestModule,
        Accessible.TestModuleEnforceKeys
      ],
      summary: [threshold: 70]
    ]
  end
end
