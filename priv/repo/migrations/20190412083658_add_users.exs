defmodule EctoIssueWithOver.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\"", "")

    create table(:users, primary_key: false) do
      add(:id, :uuid, primary_key: true, default: fragment("uuid_generate_v4()"))
      add(:name, :string, null: :false)
    end
  end
end
