defmodule KryptonWeb.Router do
  use KryptonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KryptonWeb do
    pipe_through :api

    resources "/client", ClientController, except: [:new, :edit]
  end
end
