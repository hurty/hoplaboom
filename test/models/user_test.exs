defmodule Hoplaboom.UserTest do
  use Hoplaboom.ModelCase

  alias Hoplaboom.User

  @valid_attrs %{email: "some content", name: "some content", password_hash: "some content"}
  @invalid_attrs %{name: "Justa Name"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
