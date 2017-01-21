defmodule Hoplaboom.Membership do
  use Hoplaboom.Web, :model

  schema "memberships" do
    belongs_to :organization, Hoplaboom.Organization
    belongs_to :user, Hoplaboom.User
  end

  @required_fields ~w(user_id organization_id)a

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:organization_id, name: "memberships_organization_id_user_id_index")
  end
end
