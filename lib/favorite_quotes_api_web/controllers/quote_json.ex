defmodule FavoriteQuotesApiWeb.QuoteJSON do
  alias FavoriteQuotesApi.Quotes.Quote

  @doc """
  Renders a list of quotes.
  """
  def index(%{quotes: quotes}) do
    %{data: for(quote <- quotes, do: data(quote))}
  end

  @doc """
  Renders a single quote.
  """
  def show(%{quote: quote}) do
    %{data: data(quote)}
  end

  defp data(%Quote{} = quote) do
    %{
      id: quote.id,
      text: quote.text,
      author: quote.author
    }
  end
end
