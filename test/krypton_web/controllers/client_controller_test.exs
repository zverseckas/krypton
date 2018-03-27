defmodule KryptonWeb.ClientControllerTest do
  use KryptonWeb.ConnCase, async: true

  import Krypton.Factory

  setup %{conn: conn} do
    {:ok,
     client: insert(:client),
     conn: put_req_header(conn, "accept", "application/json")
    }
  end

  describe "index" do
    test "lists all clients", %{conn: conn, client: client} do
      conn = get conn, client_path(conn, :index)
      
      data = json_response(conn, 200)["data"]
      [client_json | _tail] = data

      assert length(data) === 1
      assert client_json["id"] === client.id
      assert client_json["title"] === client.title
    end
  end
end
