defmodule Krypton.ClientValidatorTest do
  use Krypton.DataCase, async: true
  import Krypton.Factory

  alias Krypton.Clients.{
    Client,
    ClientValidator
  }

  describe "client_validator" do
    setup :changeset

    test "succeeds with a valid changeset", context do
      assert valid?(context.changeset)
    end

    @tag invalid: :title_presence
    test "fails with no title", context do
      refute valid?(context.changeset)
    end

    @tag invalid: :description_presence
    test "fails with no description", context do
      refute valid?(context.changeset)
    end

    @tag invalid: :redirect_urls_presence
    test "fails with no redirect urls", context do
      refute valid?(context.changeset)
    end

    @tag invalid: :secret_presence
    test "fails with no secret", context do
      refute valid?(context.changeset)
    end

    @tag invalid: :title_length
    test "fails with title too short", context do
      refute valid?(context.changeset)
    end

    @tag invalid: :description_length
    test "fails with description too short", context do
      refute valid?(context.changeset)
    end
  end

  defp changeset(context) do
    [changeset: Client.changeset(%Client{}, invalid_params(context[:invalid]))]
  end

  def valid?(changeset) do
    changeset
    |> ClientValidator.validate()
    |> ClientValidator.valid?()
  end

  defp invalid_params(invalid_attribute) do
    case invalid_attribute do
      :title_presence ->
        params_for(:client, title: nil)

      :description_presence ->
        params_for(:client, description: nil)

      :redirect_urls_presence ->
        params_for(:client, redirect_urls: nil)

      :secret_presence ->
        params_for(:client, secret: nil)

      :title_length ->
        params_for(:client, title: "u")

      :description_length ->
        params_for(:client, description: "p")

      _ ->
        params_for(:client)
    end
  end
end
