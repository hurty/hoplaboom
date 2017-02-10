defmodule Hoplaboom.UserController do
  use Hoplaboom.Web, :controller
  alias Hoplaboom.User
  plug :authenticate

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html")
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: home_path(conn, :index))
      |> halt()
    end
  end
end