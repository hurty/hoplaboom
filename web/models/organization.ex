defmodule Hoplaboom.Organization do
  use Hoplaboom.Web, :model

  schema "organizations" do
    field :name, :string
    timestamps()

    has_many :memberships, Hoplaboom.Membership
    has_many :users, through: [:memberships, :user]
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
