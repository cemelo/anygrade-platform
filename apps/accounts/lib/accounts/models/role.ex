defmodule Accounts.Role do
  use Ecto.Schema

  import Ecto
  import Ecto.Changeset
  import Ecto.Query
  
  schema "roles" do
    field :name, :string
    field :description, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description])
    |> validate_required([:name, :description])
  end
  
end