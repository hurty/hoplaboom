defmodule Hoplaboom.User do
  use Hoplaboom.Web, :model

  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    timestamps()

    has_many :memberships, Hoplaboom.Membership
    has_many :organizations, through: [:memberships, :organization]
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name, :password_hash])
    |> validate_required([:email, :name, :password_hash])
    |> unique_constraint(:email)
  end
end
