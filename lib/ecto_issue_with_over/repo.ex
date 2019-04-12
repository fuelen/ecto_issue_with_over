defmodule EctoIssueWithOver.Repo do
  use Ecto.Repo,
    otp_app: :ecto_issue_with_over,
    adapter: Ecto.Adapters.Postgres
end
