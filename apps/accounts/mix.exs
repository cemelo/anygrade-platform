defmodule Accounts.Mixfile do
  use Mix.Project

  def project do
    [app: :accounts,
     version: "0.1.0",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     elixirc_paths: elixirc_paths(Mix.env),
     deps: deps]
  end

  def application do
    [
      applications: [
        :arc_ecto,
        :db_connection,
        :ecto,
        :ex_machina,
        :logger,
        :postgrex,
      ],
      mod: {Accounts.Application, []}
    ]
  end

  defp deps do
    [
      {:arc, "~> 0.5.2"},
      {:arc_ecto, "~> 0.4.3"},
      {:comeonin, "~> 2.5"},
      {:db_connection, "~> 1.0.0-rc.5"},
      {:ecto, "~> 2.0.4"},
      {:ex_machina, "~> 1.0", only: :test},
      {:poison, "~> 2.2.0"},
      {:postgrex, "~> 0.11.2"},
    ]
  end

  # This makes sure your factory and any other modules in test/support are compiled
  # when in the test environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]
end
