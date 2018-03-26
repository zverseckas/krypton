# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :krypton,
  ecto_repos: [Krypton.Repo]

# Configures the endpoint
config :krypton, KryptonWeb.Endpoint,
  url: [host: "localhost"],
  port: System.get_env("PORT") || 4000,
  secret_key_base: "4XbQyMsJ9uvb2ko+uJdIa+PGy8WFtDobjblJ7VOCqX/vf1mMcrgdNwbY/yH9jCs6",
  render_errors: [view: KryptonWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Krypton.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
