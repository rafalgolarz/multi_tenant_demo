use Mix.Config

config :multi_tenant_demo,
  ecto_repos: [MultiTenantDemo.Repo]

config :multi_tenant_demo, MultiTenantDemo.Repo, migration_timestamps: [type: :utc_datetime]

# multi-tenancy
config :triplex,
  repo: MultiTenantDemo.Repo,
  tenant_prefix: "demo_tenant_",
  tenant_field: :tenant_key

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
