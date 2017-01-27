defmodule Hoplaboom.Registration do
  use Hoplaboom.Web, :model
  alias Hoplaboom.{User, Organization, Membership, Repo}

  embedded_schema do
    field :name
    field :organization_name
    field :email
    field :password_hash
  end

  @required_fields ~w(name organization_name email password_hash)a

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end

  def to_multi(params \\ %{}) do
    Ecto.Multi.new
    |> Ecto.Multi.insert(:user, user_changeset(params))
    |> Ecto.Multi.insert(:organization, organization_changeset(params))
    |> Ecto.Multi.run :membership, fn changes ->
      Repo.insert membership_changeset(changes)
    end
  end

  defp user_changeset(params) do
    user_params = Map.take(params, ["name", "email", "password_hash"])
    User.changeset(%User{}, user_params)
  end

  defp organization_changeset(%{"organization_name" => name}) do
    Organization.changeset(%Organization{}, %{name: name})
  end

  defp membership_changeset(changes) do
    Membership.changeset(
      %Membership{
        organization_id: changes.organization.id,
        user_id: changes.user.id
      }
    )
  end
end
