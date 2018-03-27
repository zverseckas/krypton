defmodule Krypton.Clients.ClientValidator do
  import Ecto.Changeset

  @behaviour Krypton.Behaviours.Validator

  @required_attributes ~w(
    secret
    title
    description
    redirect_urls
  )a

  @min_title_length 6
  @min_description_length 6

  def validate(%Ecto.Changeset{} = changeset) do
    changeset
    |> validate_required(@required_attributes)
    |> validate_length(
      :title,
      min: @min_title_length
    )
    |> validate_length(
      :description,
      min: @min_description_length
    )
  end

  def valid?(%Ecto.Changeset{valid?: valid}), do: valid
end