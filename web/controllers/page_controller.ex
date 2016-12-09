defmodule Hoplaboom.PageController do
  use Hoplaboom.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
