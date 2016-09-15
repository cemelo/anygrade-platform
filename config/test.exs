use Mix.Config

config :accounts, Accounts.Repo,
	adapter: Ecto.Adapters.Postgres,
  database: "anygrade_test",
  username: "carlos",
  password: "",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1