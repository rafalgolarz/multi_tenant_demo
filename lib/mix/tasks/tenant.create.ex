defmodule Mix.Tasks.Tenant.Create do
  # lib/mix/tasks/tenant.create.ex
  use Mix.Task

  alias MultiTenantDemo.Repo

  @shortdoc "Creates the given tenant on the given repo. "
  def run(args) do
    Mix.Task.run("app.start")
    # the sake of simplicity we don't validate the list
    for t <- args, do: create(t)
  end

  defp create(tenant) do
    if Triplex.exists?(tenant, Repo) do
      {:error, :tenant_exists}
    else
      Triplex.create(tenant, Repo)
    end
  end
end
