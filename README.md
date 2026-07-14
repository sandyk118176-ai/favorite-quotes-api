# Favorite Quotes API (Backend)

A REST API built with Elixir/Phoenix for saving favorite quotes and authors. Provides full CRUD endpoints, backed by PostgreSQL.

**Frontend repo:** [favorite-quotes](https://github.com/sandyk118176-ai/favorite-quotes)

## Endpoints

| Method | Endpoint          | Description        |
|--------|-------------------|---------------------|
| GET    | /api/quotes       | List all quotes     |
| POST   | /api/quotes       | Create a quote       |
| PUT    | /api/quotes/:id   | Update a quote        |
| DELETE | /api/quotes/:id   | Delete a quote        |

## Tech Stack

- Elixir / Phoenix
- PostgreSQL / Ecto
- CORS-enabled for local frontend development

## What I learned building this

This was my second Phoenix API, built with less guidance than my first project. It reinforced how Phoenix's generators scaffold a full CRUD resource, and how to structure a schema with multiple string fields instead of a boolean flag.

## Running locally

1. Clone this repo
2. Copy `config/dev.exs.example` to `config/dev.exs` and fill in your local PostgreSQL password
3. `mix deps.get`
4. `mix ecto.create && mix ecto.migrate`
5. `mix phx.server`
6. API available at `localhost:4000/api/quotes`