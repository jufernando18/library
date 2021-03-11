# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :library, LibraryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4M7tCI3LC3Ytnw6Aub3/IM9sQU42MYnFAd/rx8+AbuHmRYPROez32Yv8p2xKgSVb",
  render_errors: [view: LibraryWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Library.PubSub,
  live_view: [signing_salt: "pA9+pLMR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures mongo connection name
config :library, :mongo,
  name: Library.Repo,
  url: "mongodb",
  username: System.get_env("DB_USER"),
  password: System.get_env("DB_PASSWORD"),
  database: System.get_env("DB_NAME"),
  hostname: System.get_env("DB_HOST"),
  port: System.get_env("DB_PORT"),
  pool_size: 1

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
