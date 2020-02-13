use Mix.Config

# Configure your database
config :multi_tenant_demo, MultiTenantDemo.Repo,
  username: System.get_env("POSTGRES_USER") || "postgres",
  password: System.get_env("POSTGRES_PASSWORD") || "postgres",
  database: System.get_env("POSTGRES_DB") || "multitenantdemo_test",
  hostname: System.get_env("POSTGRES_HOST") || "localhost",
  port: System.get_env("POSTGRES_PORT") || "5432",
  # how connection data and configuration whenever there is an error attempting
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
