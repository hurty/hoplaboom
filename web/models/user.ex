defmodule Hoplaboom.User do
  use Hoplaboom.Web, :model

  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name, :password_hash])
    |> validate_required([:email, :name, :password_hash])
  end
end
