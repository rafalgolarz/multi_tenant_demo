defmodule MultiTenantDemo.Repo do
  use Ecto.Repo,
    otp_app: :multi_tenant_demo,
    adapter: Ecto.Adapters.Postgres
end
