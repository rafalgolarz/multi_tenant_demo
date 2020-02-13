defmodule Mix.Tasks.Tenant.Drop do
  # lib/mix/tasks/tenant.drop.ex
  use Mix.Task

  alias MultiTenantDemo.Repo

  @shortdoc "Drops the given tenant on the given repo."
  def run(args) do
    Mix.Task.run("app.start")
    # the sake of simplicity we don't validate the list
    for t <- args, do: drop(t)
  end

  defp drop(tenant) do
    if Triplex.exists?(tenant, Repo) do
      Triplex.drop(tenant, Repo)
    else
      {:error, :cannot_find_tenant}
    end
  end
end
