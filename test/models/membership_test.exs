defmodule Hoplaboom.MembershipTest do
  use Hoplaboom.ModelCase

  alias Hoplaboom.Membership

  @valid_attrs %{user_id: 1, organization_id: 1}
  @invalid_attrs %{user_id: 1}

  test "changeset with valid attributes" do
    changeset = Membership.changeset(%Membership{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Membership.changeset(%Membership{}, @invalid_attrs)
    refute changeset.valid?
  end
end
