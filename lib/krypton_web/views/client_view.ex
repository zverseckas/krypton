defmodule KryptonWeb.ClientView do
  use KryptonWeb, :view
  alias KryptonWeb.ClientView

  def render("index.json", %{clients: clients}) do
    %{data: render_many(clients, ClientView, "client.json")}
  end

  def render("show.json", %{client: client}) do
    %{data: render_one(client, ClientView, "client.json")}
  end

  def render("client.json", %{client: client}) do
    %{id: client.id,
      title: client.title,
      description: client.description,
      home_url: client.home_url,
      redirect_urls: client.redirect_urls,
      privacy_policy_url: client.privacy_policy_url,
      image_url: client.image_url}
  end
end
