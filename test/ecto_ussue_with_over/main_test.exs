defmodule MainTest do
  use EctoIssueWithOver.DataCase

  alias EctoIssueWithOver.Post
  alias EctoIssueWithOver.User

  @records_range 1..3
  test "over" do
    @records_range
    |> Enum.each(fn number ->
      {:ok, user} =
        %User{name: "name#{number}"}
        |> Repo.insert()

      @records_range
      |> Enum.each(fn number ->
        %Post{text: "text##{number} from #{user.name}", user: user}
        |> Repo.insert()
      end)
    end)

    # query =
    #   from(users in User,
    #     join: posts in assoc(users, :posts),
    #     select: %{user: users, post_ids: type(over(fragment("ARRAY_AGG(?)", posts.id), {:array, :binary_id}), :post_ids)},
    #     distinct: users.id,
    #     windows: [post_ids: [partition_by: users.id]]
    #   )
    #
    # == Compilation error in file test/ecto_ussue_with_over/main_test.exs ==
    # ** (Ecto.Query.CompileError) `type(over(fragment("ARRAY_AGG(?)", posts.id()), {:array, :binary_id}), :post_ids)` is not a valid query expression.
    #
    # * If you intended to call a database function, please check the documentation
    #   for Ecto.Query to see the supported database expressions
    #
    # * If you intended to call an Elixir function or introduce a value,
    # you need to explicitly interpolate it with ^
    query =
      from(users in User,
        join: posts in assoc(users, :posts),
        select: %{
          user: users,
          post_ids: over(fragment("ARRAY_AGG(?)", posts.id), :post_ids)
        },
        distinct: users.id,
        windows: [post_ids: [partition_by: users.id]]
      )

    query
    |> Repo.all()
    |> IO.inspect()

    assert true
  end
end
