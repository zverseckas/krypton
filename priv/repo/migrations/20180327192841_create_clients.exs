defmodule Krypton.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :secret, :string, null: false

      add :title, :string, null: false
      add :description, :string, null: false
      add :home_url, :string
      add :redirect_urls, :string
      add :privacy_policy_url, :string
      add :image_url, :string

      timestamps()
    end
  end
end
