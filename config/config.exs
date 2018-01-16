# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cwb_graphql_intro,
  ecto_repos: [CwbGraphqlIntro.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :cwb_graphql_intro, CwbGraphqlIntroWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s8Hljb1dq9mDuf+gbsHKsrZ/5RsZXus4ffFmDr/B/+NBZVKCH1dL5LRGGaN/rN29",
  render_errors: [view: CwbGraphqlIntroWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: CwbGraphqlIntro.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
