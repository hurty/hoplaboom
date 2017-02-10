defmodule Hoplaboom.HomeController do
  use Hoplaboom.Web, :controller
  alias Hoplaboom.Registration

  def index(conn, _params) do
    render conn, "index.html", changeset: Registration.changeset(%Registration{})
  end

  def sign_up(conn, %{"registration" => registration_params}) do
    changeset = Registration.changeset(%Registration{}, registration_params)
    if changeset.valid? do
      case Repo.transaction(Registration.to_multi(registration_params)) do
        {:ok, %{user: user, organization: organization}} ->
          conn
          |> Hoplaboom.Auth.login(organization, user)
          |> redirect(to: user_path(conn, :index))
        {:error, _failed_operation, failed_value, _changes_so_far} ->
          render(conn, "index.html", changeset: %{copy_errors(failed_value, changeset) | action: :insert})
      end
    else
      render(conn, "index.html", changeset: %{changeset | action: :insert})
    end
  end

  defp copy_errors(from, to) do
    Enum.reduce from.errors, to, fn {field, {msg, additional}}, acc ->
      Ecto.Changeset.add_error(acc, field, msg, additional: additional)
    end
  end
end
