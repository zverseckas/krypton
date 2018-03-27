defmodule Krypton.ClientsTest do
  use Krypton.DataCase, async: true

  alias Krypton.Clients
  alias Krypton.Clients.Client

  import Krypton.Factory

  @clients_count 3

  setup do
    [client | _tail] = create_clients()
    [client: client]
  end

  describe "clients" do
    test "list_clients/0 returns a list of all clients" do
      clients = Clients.list_clients()

      assert length(clients) == @clients_count
      assert [%Client{} | _tail] = clients
    end

    test "get_client!/1 returns a client by id", context do
      assert %Client{} = Clients.get_client!(context.client.id)
    end

    test "get_client!/1 raises an error when client is not found" do
      assert_raise Ecto.NoResultsError, fn ->
        Clients.get_client!("0e31998f-503f-4218-a801-c8bb7ff9498b")
      end
    end

    test "delete_client/1 deletes a client", context do
      {:ok, deleted} = Clients.delete_client(context.client)

      assert deleted.id == context.client.id
      assert_raise Ecto.NoResultsError, fn ->
        Clients.get_client!(deleted.id)
      end
    end

    test "change_client/1 returns a client changeset", context do
      assert Clients.change_client(context.client) ==
        Client.changeset(context.client, %{})
    end

    test "create_client/1 creates a client from attributes" do
      attrs = params_for(:client)
      {:ok, client} = Clients.create_client(attrs)

      assert client.secret == attrs.secret
      assert client.title == attrs.title
      assert client.description == attrs.description
      assert client.home_url == attrs.home_url
      assert client.redirect_urls == attrs.redirect_urls
      assert client.privacy_policy_url == attrs.privacy_policy_url
      assert client.image_url == attrs.image_url
    end

    test "update_client/2 updates a client from attributes", context do
      attrs = params_for(:client)
      {:ok, client} = Clients.update_client(context.client, attrs)

      assert client.secret == attrs.secret
      assert client.title == attrs.title
      assert client.description == attrs.description
      assert client.home_url == attrs.home_url
      assert client.redirect_urls == attrs.redirect_urls
      assert client.privacy_policy_url == attrs.privacy_policy_url
      assert client.image_url == attrs.image_url
    end
  end

  defp create_clients do
    Enum.map(1..@clients_count, fn _ -> insert(:client) end)
  end
end
