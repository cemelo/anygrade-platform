defmodule Accounts.UserTest do
  use Accounts.ModelCase

  alias Accounts.User

  @valid_attrs %{avatar: nil, email: "john@example.com", name: "John Doe", profile: %{}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
