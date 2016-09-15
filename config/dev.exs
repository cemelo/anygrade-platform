use Mix.Config

config :accounts, Accounts.Repo,
	adapter: Ecto.Adapters.Postgres,
  database: "anygrade_dev",
  username: "postgres",
  password: "",
  hostname: "localhost"

config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1