defmodule Hoplaboom.Registration do
  alias Hoplaboom.{User, Organization}
  alias Ecto.Multi

  def sign_up(params) do
    Multi.new
    |> Multi.insert(:user, User.changeset(%User{}, params))
    |> Multi.insert(:organization, Organization.changeset(%Organization{}, params))
  end
end
