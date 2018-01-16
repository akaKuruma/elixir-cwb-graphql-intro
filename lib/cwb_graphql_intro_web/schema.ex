defmodule CwbGraphqlIntroWeb.Schema do
  use Absinthe.Schema

  query do
    field :users, list_of(:user)
  end
end
