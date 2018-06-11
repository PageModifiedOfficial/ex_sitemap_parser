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
  def get_map(url) do
    case HTTPoison.get(url) do
      {:ok, response} -> IO.inspect response
      {:error, msg} -> IO.inspect msg
    end
  end
end
