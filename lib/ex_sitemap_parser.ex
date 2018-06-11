defmodule ExSitemapParser do
  @moduledoc """
  Documentation for ExSitemapParser.
  """

  @doc """
  Get Map

  ## Examples

      iex> ExSitemapParser.hello
      :world

  """
  def sitemap_for(url) do
    url |> get_map |> process_response
  end

  def get_map(url) do
    case HTTPoison.get(url) do
      {:ok, response} -> response
      {:error, msg} -> msg
    end
  end

  def process_response(%HTTPoison.Error{} = response) do
    IO.inspect response, label: "Error"
  end
  def process_response(%HTTPoison.Response{} = response) do
    IO.inspect response, label: "Success"
  end
end
