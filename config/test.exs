use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ecto_issue_with_over, EctoIssueWithOverWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ecto_issue_with_over, EctoIssueWithOver.Repo,
  username: "postgres",
  password: "postgres",
  database: "ecto_issue_with_over_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
