defmodule EctoIssueWithOver.Repo.Migrations.AddPosts do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add(:id, :uuid, primary_key: true, default: fragment("uuid_generate_v4()"))
      add(:text, :string, null: :false)

      add(:user_id, references(:users, on_delete: :restrict, type: :uuid), null: false)
    end
  end
end
