defmodule Accounts.Authorization do
	use Ecto.Schema

  import Ecto
  import Ecto.Changeset
  import Ecto.Query

	schema "authorizations" do
    field :provider, :string
    field :uid, :string
    field :token, :string
    field :refresh_token, :string
    field :expires_at, :integer
    
    belongs_to :user, Accounts.User

    timestamps()
  end

  @required_fields ~w(provider uid token)a
  @optional_fields ~w(refresh_token expires_at)a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end	
end