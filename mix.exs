defmodule ExSitemapParser.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_sitemap_parser,
      version: "0.1.0",
      elixir: "~> 1.6",
      description: description(),
      package: package(),
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
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:mox, "~> 0.3", only: :test}
    ]
  end

  defp description() do
    "Tool for parsing sitemaps and sitemap indices"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "ex_sitemap_parser",
      # These are the default files included in the package
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ValleyHosting/ex_sitemap_parser"},
      maintainers: "refriedchicken"
    ]
  end
end
