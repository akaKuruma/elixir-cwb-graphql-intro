defmodule CwbGraphqlIntroWeb.Router do
  use CwbGraphqlIntroWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: CwbGraphqlIntroWeb.Schema
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: CwbGraphqlIntroWeb.Schema
  end

end
