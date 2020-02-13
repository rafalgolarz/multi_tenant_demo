defmodule Mix.Tasks.Tenant.Rename do
  # lib/mix/tasks/tenant.rename.ex
  use Mix.Task

  alias MultiTenantDemo.Repo

  @shortdoc "Renames the given tenant on the given repo."
  def run(args) do
    Mix.Task.run("app.start")
    # the sake of simplicity we don't validate the list
    rename(hd(args), tl(args))
  end

  defp rename(current_name, new_name) do
    if Triplex.exists?(current_name, Repo) do
      Triplex.rename(current_name, new_name, Repo)
    else
      {:error, :cannot_find_tenant}
    end
  end
end
