defmodule EctoIssueWithOver.Post do
  use EctoIssueWithOver, :schema

  schema "posts" do
    field(:text, :string)

    belongs_to(:user, EctoIssueWithOver.User)
  end
end
