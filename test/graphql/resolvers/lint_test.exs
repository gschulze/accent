defmodule AccentTest.GraphQL.Resolvers.Lint do
  use Accent.RepoCase

  alias Accent.{
    Language,
    Lint.Message,
    Lint.Replacement,
    Project,
    Repo,
    Revision,
    Translation,
    User
  }

  alias Accent.GraphQL.Resolvers.Lint, as: Resolver

  defmodule PlugConn do
    defstruct [:assigns]
  end

  @user %User{email: "test@test.com"}

  setup do
    user = Repo.insert!(@user)
    french_language = %Language{name: "french"} |> Repo.insert!()
    project = %Project{main_color: "#f00", name: "My project"} |> Repo.insert!()

    revision = %Revision{language_id: french_language.id, project_id: project.id, master: true, slug: "fr"} |> Repo.insert!()
    context = %{context: %{conn: %PlugConn{assigns: %{current_user: user}}}}

    {:ok, [user: user, project: project, revision: revision, context: context]}
  end

  test "lint", %{revision: revision, context: context} do
    master_translation = %Translation{revision: revision, conflicted: false, key: "ok2", corrected_text: "bar foo", proposed_text: "bar"} |> Repo.insert!()

    translation =
      %Translation{revision: revision, master_translation: master_translation, conflicted: false, key: "ok", corrected_text: "bar  foo", proposed_text: "bar"} |> Repo.insert!()

    {:ok, result} = Resolver.lint_batched_translation(translation, %{}, context)

    assert result === [
             %Message{
               replacement: %Replacement{value: "bar foo", label: "bar foo"},
               check: :double_spaces,
               text: "bar  foo"
             }
           ]
  end
end
