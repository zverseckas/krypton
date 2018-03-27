defmodule KryptonWeb.ClientController do
  use KryptonWeb, :controller

  alias Krypton.Clients
  alias Krypton.Clients.Client

  action_fallback KryptonWeb.FallbackController

  def index(conn, _params) do
    clients = Clients.list_clients()
    render(conn, "index.json", clients: clients)
  end

  def create(conn, %{"client" => client_params}) do
    with {:ok, %Client{} = client} <- Clients.create_client(client_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", client_path(conn, :show, client))
      |> render("show.json", client: client)
    end
  end

  def show(conn, %{"id" => id}) do
    client = Clients.get_client!(id)
    render(conn, "show.json", client: client)
  end

  def update(conn, %{"id" => id, "client" => client_params}) do
    client = Clients.get_client!(id)

    with {:ok, %Client{} = client} <- Clients.update_client(client, client_params) do
      render(conn, "show.json", client: client)
    end
  end

  def delete(conn, %{"id" => id}) do
    client = Clients.get_client!(id)
    with {:ok, %Client{}} <- Clients.delete_client(client) do
      send_resp(conn, :no_content, "")
    end
  end
end
