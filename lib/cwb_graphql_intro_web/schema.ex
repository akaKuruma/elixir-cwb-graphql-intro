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
    field :user_register, :user do
      arg :name, non_null(:string)
      arg :meetup_profile_link, :string
      arg :present, :boolean

      resolve fn _root, args, _info ->
        case CwbElixirMeetup.create_user(args) do
          {:ok, user} -> {:ok, user}
          _error -> { :error, "could not register user" }
        end
      end
    end
  end
end
