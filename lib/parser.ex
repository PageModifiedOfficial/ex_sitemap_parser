defmodule ExSitemapParser.Parser do
  import SweetXml
  @callback parse(doc :: String.t()) :: map()

  def parse!(doc) do
    case doc |> SweetXml.xpath(~x"//sitemapindex"o) |> is_nil do
      true -> ExSitemapParser.Parser.Sitemap.parse(doc)
      false -> ExSitemapParser.Parser.SitemapIndex.parse(doc)
    end
  end
end

defmodule ExSitemapParser.Parser.SitemapIndex do
  import SweetXml
  @behaviour ExSitemapParser.Parser
  @schema [
      sitemaps: [ ~x[//sitemapindex/sitemap/loc]l,
        sitemap: ~x[./text()]s
      ]
    ]

  def parse(doc) do
    doc |> SweetXml.xmap(@schema) |> get_sitemaps
  end

  def get_sitemaps(sitemaps) do
    sitemaps[:sitemaps] |> Enum.map(fn sitemap -> ExSitemapParser.sitemap_for(sitemap[:sitemap]) end)
  end
end

defmodule ExSitemapParser.Parser.Sitemap do
  import SweetXml
  @behaviour ExSitemapParser.Parser
  @schema [
      urls: [ ~x[//urlset/url/loc]l,
        url: ~x[./text()]s
      ]
    ]

  def parse(doc) do
    doc |> SweetXml.xmap(@schema)
  end
end