defmodule CwbGraphqlIntro.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :meetup_profile_link, :string
      add :present, :boolean, default: false, null: false

      timestamps()
    end

  end
end
