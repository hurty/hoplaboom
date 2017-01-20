defmodule Hoplaboom.Repo.Migrations.CreateMembership do
  use Ecto.Migration

  def change do
    create table(:memberships) do
      add :organization_id, references(:organizations)
      add :user_id, references(:users)
    end
  end
end
