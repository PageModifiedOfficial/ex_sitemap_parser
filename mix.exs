defmodule ExSitemapParser.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_sitemap_parser,
      version: "0.1.0",
      elixir: "~> 1.6",
      description: "Tool for parsing sitemaps and sitemap indices",
      licenses: "MIT",
      maintainers: "ValleyHosting, refriedchicken",
      links: "https://github.com/ValleyHosting/ex_sitemap_parser",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:sweet_xml, "~> 0.6.5"},
      {:httpoison, "~> 1.0.0"},
      {:mox, "~> 0.3", only: :test}
    ]
  end
end
