defmodule ExSitemapParser.Parser do
  import SweetXml

  def parse(doc) do
    SweetXml.parse(doc)
  end
end