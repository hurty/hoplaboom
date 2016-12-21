defmodule Hoplaboom.RegistrationController do
  use Hoplaboom.Web, :controller
  alias Hoplaboom.Registration

  def sign_up(conn, %{"registration" => registration_params}) do
    result = Registration.sign_up(registration_params)

    case Repo.transaction(result) do
      {:ok, %{user: user, organization: organization}} ->
        conn
        |> redirect(to: home_path(conn, :index))
      {:error, failed_operation, failed_value, changes_so_far} ->
        render(conn, "new.html")
    end
  end
end
