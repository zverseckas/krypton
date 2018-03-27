defmodule Krypton.ClientFactory do
  defmacro __using__(_opts) do
    quote do
      alias Krypton.Clients.Client

      def client_factory do
        %Client{
          secret: Faker.String.base64(),
          title: Faker.Name.title(),
          description: Faker.Lorem.sentence(),
          home_url: Faker.Internet.url(),
          redirect_urls: Faker.Internet.url(),
          privacy_policy_url: Faker.Internet.url(),
          image_url: Faker.Internet.image_url(),
        }
      end
    end
  end
end
