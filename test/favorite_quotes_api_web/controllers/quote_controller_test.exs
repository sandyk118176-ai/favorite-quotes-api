defmodule FavoriteQuotesApiWeb.QuoteControllerTest do
  use FavoriteQuotesApiWeb.ConnCase

  import FavoriteQuotesApi.QuotesFixtures
  alias FavoriteQuotesApi.Quotes.Quote

  @create_attrs %{
    text: "some text",
    author: "some author"
  }
  @update_attrs %{
    text: "some updated text",
    author: "some updated author"
  }
  @invalid_attrs %{text: nil, author: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all quotes", %{conn: conn} do
      conn = get(conn, ~p"/api/quotes")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create quote" do
    test "renders quote when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/quotes", quote: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/quotes/#{id}")

      assert %{
               "id" => ^id,
               "author" => "some author",
               "text" => "some text"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/quotes", quote: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update quote" do
    setup [:create_quote]

    test "renders quote when data is valid", %{conn: conn, quote: %Quote{id: id} = quote} do
      conn = put(conn, ~p"/api/quotes/#{quote}", quote: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/quotes/#{id}")

      assert %{
               "id" => ^id,
               "author" => "some updated author",
               "text" => "some updated text"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, quote: quote} do
      conn = put(conn, ~p"/api/quotes/#{quote}", quote: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete quote" do
    setup [:create_quote]

    test "deletes chosen quote", %{conn: conn, quote: quote} do
      conn = delete(conn, ~p"/api/quotes/#{quote}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/quotes/#{quote}")
      end
    end
  end

  defp create_quote(_) do
    quote = quote_fixture()

    %{quote: quote}
  end
end
