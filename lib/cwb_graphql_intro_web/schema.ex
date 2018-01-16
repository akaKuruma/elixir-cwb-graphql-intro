defmodule CwbGraphqlIntroWeb.Schema do
  use Absinthe.Schema
  alias CwbGraphqlIntro.CwbElixirMeetup

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :meetup_profile_link, :string
    field :present, :boolean
  end

  query do
    field :users, list_of(:user) do
      resolve fn _, _ ->
        {:ok, CwbElixirMeetup.list_users()}
      end
    end
  end

  mutation do
  end
end
