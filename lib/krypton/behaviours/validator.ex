defmodule Krypton.Behaviours.Validator do
  @moduledoc """
  Behaviour for ecto validators
  """

  @callback validate(Ecto.Model.t()) :: Ecto.Model.t()
  @callback valid?(Ecto.Model.t()) :: boolean
end
