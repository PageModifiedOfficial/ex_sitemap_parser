defmodule ExSitemapParser do
  @fetcher Application.get_env(:ex_sitemap_parser, :fetcher)
  @moduledoc """
  Documentation for ExSitemapParser.
  """

  @doc """
  Get Map

  ## Examples

      iex> ExSitemapParser.sitemap_for("http://www.test.com/sitemap.xml")
      :world

  """
  def sitemap_for(url) do
    url |> @fetcher.get_sitemap |> process_response
  end

  @doc """
  Get Map

  ## Examples

      iex> ExSitemapParser.process_response(%HTTPoison.Error{})
      :world
      iex> ExSitemapParser.process_response(%HTTPoison.Response{})
      :world

  """
  def process_response({:error, %HTTPoison.Error{} = error}) do
    {:error, error.reason}
  end
  def process_response({:ok, %HTTPoison.Response{status_code: 200} = response}) do
    {:ok, response.body}
  end
  def process_response({:ok, %HTTPoison.Response{} = response}) do
    {:error, "Response Code: #{response.status_code}"}
  end
end
