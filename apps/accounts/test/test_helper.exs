# Ensures that ex machina starts before ExUnit
{:ok, _} = Application.ensure_all_started(:ex_machina)

ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(Accounts.Repo, :manual)
