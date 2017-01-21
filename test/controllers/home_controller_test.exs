defmodule Hoplaboom.HomeControllerTest do
  use Hoplaboom.ConnCase

  test "get the sign up form", %{conn: conn} do
    conn = get conn, home_path(conn, :index)
    assert html_response(conn, 200) =~ ~r/Create a new account/
  end

  @valid_sign_up_params %{name: "Pierre Hurtevent", organization_name: "DoudouCorp", email: "pierre.hurtevent@gmail.com", password_hash: "passwd"}

  test "sign up for a new account", %{conn: conn} do
    conn = post conn, home_path(conn, :sign_up), registration: @valid_sign_up_params
    assert html_response(conn, 200) =~ ~r/Account successfully created/
  end
end
