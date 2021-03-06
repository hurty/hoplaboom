defmodule Hoplaboom.Router do
  use Hoplaboom.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Hoplaboom.Auth, repo: Hoplaboom.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Hoplaboom do
    pipe_through :browser # Use the default browser stack

    get "/", HomeController, :index
    post "/sign_up", HomeController, :sign_up

    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Hoplaboom do
  #   pipe_through :api
  # end
end
