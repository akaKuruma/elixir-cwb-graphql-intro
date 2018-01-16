defmodule CwbGraphqlIntro.CwbElixirMeetup.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias CwbGraphqlIntro.CwbElixirMeetup.User


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :meetup_profile_link, :string
    field :name, :string
    field :present, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :meetup_profile_link, :present])
    |> validate_required([:name, :meetup_profile_link, :present])
  end
end
