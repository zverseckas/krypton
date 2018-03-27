defmodule Krypton.Clients do
  @moduledoc """
  The Clients context.
  """

  import Ecto.Query, warn: false
  alias Krypton.Repo

  alias Krypton.Clients.Client

  @doc """
  Returns a list of clients.

  ## Examples

      iex> list_clients()
      [%Client{}, ...]

  """
  def list_clients, do: Repo.all(Client)

  @doc """
  Gets a single client.

  Raises `Ecto.NoResultsError` if the client does not exist.

  ## Examples

      iex> get_client!(19be859d0c1f4a7f95ddced995037350)
      %Client{}

      iex> get_client!(ebeff765ddc843e486c287fb668d5d37)
      ** (Ecto.NoResultsError)

  """
  def get_client!(id), do: Repo.get!(Client, id)

  @doc """
  Creates a client.

  ## Examples

      iex> create_client(%{field: value})
      {:ok, %Client{}}

      iex> create_client(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_client(attrs \\ %{}) do
    %Client{}
    |> Client.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a client.

  ## Examples

      iex> update_client(client, %{field: new_value})
      {:ok, %Client{}}

      iex> update_client(client, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_client(%Client{} = client, attrs) do
    client
    |> Client.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a client.

  ## Examples

      iex> delete_client(client)
      {:ok, %Client{}}

      iex> delete_client(client)
      {:error, %Ecto.Changeset{}}

  """
  def delete_client(%Client{} = client) do
    Repo.delete(client)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking client changes.

  ## Examples

      iex> change_client(client)
      %Ecto.Changeset{source: %Client{}}

  """
  def change_client(%Client{} = client) do
    Client.changeset(client, %{})
  end
end
