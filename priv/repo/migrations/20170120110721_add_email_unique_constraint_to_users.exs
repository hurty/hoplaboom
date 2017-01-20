defmodule Hoplaboom.Repo.Migrations.AddEmailUniqueConstraintToUsers do
  use Ecto.Migration

  def change do
    create unique_index(:users, :email)
    create unique_index(:memberships, [:organization_id, :user_id])
  end
end
