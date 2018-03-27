defmodule Krypton.Clients.Client do
  @moduledoc """
  Client model
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Krypton.Clients.Client
  alias Krypton.Clients.ClientValidator

  @attributes ~w(
    secret
    title
    description
    home_url
    redirect_urls
    privacy_policy_url
    image_url
  )a

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "clients" do
    field :secret, :string
    field :title, :string
    field :description, :string
    field :home_url, :string
    field :redirect_urls, :string
    field :privacy_policy_url, :string
    field :image_url, :string

    timestamps()
  end

  @doc false
  def changeset(%Client{} = client, attrs \\ %{}) do
    client
    |> cast(attrs, @attributes)
    |> ClientValidator.validate()
  end
end
