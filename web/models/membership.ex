defmodule Hoplaboom.Membership do
  use Hoplaboom.Web, :model

  schema "memberships" do
    belongs_to :organization, Hoplaboom.Organization
    belongs_to :user, Hoplaboom.User
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:organization_id, :user_id])
    |> unique_constraint(:organization_id, name: "memberships_organization_id_user_id_index")
  end
end
