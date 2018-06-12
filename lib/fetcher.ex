defmodule ExSitemapParser.Fetcher do
   @callback get_sitemap(url :: String.t()) :: {:ok, term} | {:error, String.t}
end

defmodule ExSitemapParser.Fetcher.HttpClient do
  @behaviour ExSitemapParser.Fetcher

  def get_sitemap(url) do
    HTTPoison.get(url)
  end
end