defmodule CwbGraphqlIntroWeb.Router do
  use CwbGraphqlIntroWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CwbGraphqlIntroWeb do
    pipe_through :api
  end
end
