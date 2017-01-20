defmodule Hoplaboom.Membership do
  use Hoplaboom.Web, :model

  schema "memberships" do
    belongs_to :organization, Hoplaboom.Organization
    belongs_to :user, Hoplaboom.User
  end
end
