# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hoplaboom,
  ecto_repos: [Hoplaboom.Repo]

# Configures the endpoint
config :hoplaboom, Hoplaboom.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7MRSdY/yh7PuOczdXGFUvjYx2kmoJC34JPtOLBDc8+l6etGIqexPpQgX8JkWHQla",
  render_errors: [view: Hoplaboom.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hoplaboom.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
