defmodule MultiTenantDemo.MixProject do
  use Mix.Project

  def project do
    [
      aliases: aliases(),
      app: :multi_tenant_demo,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {MultiTenantDemo.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.3"},
      # altough postgrex was listed as optional,
      # we wouldn't be able to run anything without it
      {:postgrex, "~> 0.15.3"},
      {:ecto, "~> 3.3.2"},
      {:triplex, "~> 1.3.0"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": [
        "ecto.create --quiet",
        "ecto.migrate",
        "tenant.create 'first-tenant' 'second-tenant'",
        "triplex.migrate"
      ],
      "ecto.reset": ["ecto.drop", "ecto.setup"]
    ]
  end
end
