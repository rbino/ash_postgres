defmodule AshPostgres.MultitenancyTest.Registry do
  @moduledoc false
  use Ash.Registry

  entries do
    entry(AshPostgres.MultitenancyTest.Org)
    entry(AshPostgres.MultitenancyTest.Picture)
    entry(AshPostgres.MultitenancyTest.Thing)
    entry(AshPostgres.MultitenancyTest.User)
    entry(AshPostgres.MultitenancyTest.Post)
  end
end
