defmodule FavoriteQuotesApi.Quotes.Quote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quotes" do
    field :text, :string
    field :author, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(quote, attrs) do
    quote
    |> cast(attrs, [:text, :author])
    |> validate_required([:text, :author])
  end
end
