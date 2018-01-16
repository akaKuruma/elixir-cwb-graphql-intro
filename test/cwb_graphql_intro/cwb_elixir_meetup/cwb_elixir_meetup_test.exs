defmodule CwbGraphqlIntro.CwbElixirMeetupTest do
  use CwbGraphqlIntro.DataCase

  alias CwbGraphqlIntro.CwbElixirMeetup

  describe "users" do
    alias CwbGraphqlIntro.CwbElixirMeetup.User

    @valid_attrs %{meetup_profile_link: "some meetup_profile_link", name: "some name", present: true}
    @update_attrs %{meetup_profile_link: "some updated meetup_profile_link", name: "some updated name", present: false}
    @invalid_attrs %{meetup_profile_link: nil, name: nil, present: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CwbElixirMeetup.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert CwbElixirMeetup.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert CwbElixirMeetup.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = CwbElixirMeetup.create_user(@valid_attrs)
      assert user.meetup_profile_link == "some meetup_profile_link"
      assert user.name == "some name"
      assert user.present == true
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CwbElixirMeetup.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = CwbElixirMeetup.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.meetup_profile_link == "some updated meetup_profile_link"
      assert user.name == "some updated name"
      assert user.present == false
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = CwbElixirMeetup.update_user(user, @invalid_attrs)
      assert user == CwbElixirMeetup.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = CwbElixirMeetup.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> CwbElixirMeetup.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = CwbElixirMeetup.change_user(user)
    end
  end
end
