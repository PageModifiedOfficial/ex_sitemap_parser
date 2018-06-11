defmodule ExSitemapParser.Parser do
  import SweetXml

  @schema [
      urls: [ ~x[//urlset/url/loc]l,
        url: ~x[./text()]s
      ]
    ]

  def parse(doc) do
    #SweetXml.parse(doc)
    doc |> SweetXml.xmap(@schema)
  end
end