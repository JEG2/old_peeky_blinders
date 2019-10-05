# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :peeky_blinders_ui, PeekyBlindersUiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sxVqMI0azgSVQlr0RIlRHStMjdo1XRAda8Z9z09hwyWl8a3HZFJyHI+9R//VNvte",
  render_errors: [view: PeekyBlindersUiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PeekyBlindersUi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :peeky_blinders_ui, :command_interpreter, PeekyBlindersUi.DisplayCommand

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
