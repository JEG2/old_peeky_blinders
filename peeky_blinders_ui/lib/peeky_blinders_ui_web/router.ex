defmodule PeekyBlindersUiWeb.Router do
  use PeekyBlindersUiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", PeekyBlindersUiWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PeekyBlindersUiWeb do
  #   pipe_through :api
  # end
end
