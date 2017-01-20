require IEx

defmodule Hoplaboom.HomeController do
  use Hoplaboom.Web, :controller
  alias Hoplaboom.Registration

  def index(conn, _params) do
    render conn, "index.html", changeset: Registration.changeset(%Registration{})
  end

  def sign_up(conn, %{"registration" => registration_params}) do
    changeset = Registration.changeset(%Registration{}, registration_params)
    # IEx.pry
    if changeset.valid? do
      case Repo.transaction(Registration.to_multi(registration_params)) do
        {:ok, _} ->
          # redirect(conn, to: home_path(conn, :index))
          render(conn, "index_ok.html")
        {:error, _failed_operation, _failed_value, _changes_so_far} ->
          render(conn, "index.html")
      end
    else
      render(conn, "index.html", changeset: %{changeset | action: :insert})
    end
  end
end
