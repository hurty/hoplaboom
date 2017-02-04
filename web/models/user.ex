defmodule Hoplaboom.User do
  use Hoplaboom.Web, :model

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    timestamps()

    has_many :memberships, Hoplaboom.Membership
    has_many :organizations, through: [:memberships, :organization]
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name, :password])
    |> update_change(:name, &(String.trim(&1)))
    |> update_change(:email, &(String.trim(&1)))
    |> validate_required([:email, :name, :password])
    |> validate_length(:password, min: 8, max: 100)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
