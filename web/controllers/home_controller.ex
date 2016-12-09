defmodule Hoplaboom.HomeController do
  use Hoplaboom.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
