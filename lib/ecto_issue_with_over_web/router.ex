defmodule EctoIssueWithOverWeb.Router do
  use EctoIssueWithOverWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EctoIssueWithOverWeb do
    pipe_through :api
  end
end
