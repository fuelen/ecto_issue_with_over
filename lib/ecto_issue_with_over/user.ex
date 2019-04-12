defmodule EctoIssueWithOver.User do
  use EctoIssueWithOver, :schema

  schema "users" do
    field(:name, :string)

    has_many(:posts, EctoIssueWithOver.Post)
  end
end
