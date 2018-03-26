defmodule KryptonWeb.Router do
  use KryptonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KryptonWeb do
    pipe_through :api
  end
end
