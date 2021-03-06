# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :powit,
  ecto_repos: [Powit.Repo]

# Configures the endpoint
config :powit, PowitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OyjJ1ZV4UZIi5RKQh60gckQ32i+s7SAx/AhFmxecDaJG3myb3goxlRjp5aj8qcrk",
  render_errors: [view: PowitWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Powit.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :powit, PowitWeb.Mailer,
  adapter: Swoosh.Adapters.Local

config :powit, :pow,
  user: Powit.Users.User,
  repo: Powit.Repo,
  web_module: PowitWeb,
  extensions: [PowResetPassword, PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks, mailer_backend: PowitWeb.PowMailer,
  web_mailer_module: PowitWeb



# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
