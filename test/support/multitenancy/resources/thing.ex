defmodule AshPostgres.MultitenancyTest.Thing do
  @moduledoc false
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  attributes do
    uuid_primary_key(:id)
    attribute(:name, :string, allow_nil?: false)
  end

  actions do
    defaults([:create, :read, :update, :destroy])
  end

  identities do
    identity(:unique_name, [:name])
  end

  postgres do
    table "multitenant_things"
    repo AshPostgres.TestRepo
  end

  multitenancy do
    strategy(:attribute)
    attribute(:org_id)
    parse_attribute({__MODULE__, :parse_tenant, []})
  end

  relationships do
    belongs_to(:org, AshPostgres.MultitenancyTest.Org)
    belongs_to(:user, AshPostgres.MultitenancyTest.User)
  end

  def parse_tenant("org_" <> id), do: id
end
