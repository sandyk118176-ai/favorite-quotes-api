defmodule FavoriteQuotesApi.Repo do
  use Ecto.Repo,
    otp_app: :favorite_quotes_api,
    adapter: Ecto.Adapters.Postgres
end
