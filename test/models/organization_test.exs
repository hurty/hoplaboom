defmodule Hoplaboom.OrganizationTest do
  use Hoplaboom.ModelCase

  alias Hoplaboom.Organization

  test "changeset with valid attributes" do
    changeset = Organization.changeset(%Organization{}, %{name: "DoudouCorp"})
    assert changeset.valid?
  end

  test "an organization must have a name" do
    changeset = Organization.changeset(%Organization{}, %{})
    refute changeset.valid?
  end
end
