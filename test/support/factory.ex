defmodule Krypton.Factory do
  @moduledoc """
  Module stores factories available in tests
  """
  use ExMachina.Ecto, repo: Krypton.Repo
  use Krypton.ClientFactory
end
