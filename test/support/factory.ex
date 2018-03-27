defmodule Krypton.Factory do
  use ExMachina.Ecto, repo: Krypton.Repo
  use Krypton.ClientFactory
end
