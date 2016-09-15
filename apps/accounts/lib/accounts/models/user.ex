defmodule Accounts.User do
  use Ecto.Schema
  use Arc.Ecto.Schema

  import Ecto
  import Ecto.Changeset
  import Ecto.Query

  schema "users" do
    field :name, :string
    field :email, :string
    field :picture, Accounts.UserPicture.Type
    field :profile, :map

    has_many :authorizations, Accounts.Authorization

    many_to_many :roles, Accounts.Role, join_through: "users_roles"

    timestamps
  end

  @required_fields ~w(name email)a
  @optional_fields ~w(picture profile)a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> cast_attachments(params, [:picture])
    |> cast_assoc(:roles, required: false)
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)/)
    |> unique_constraint(:email)
  end

  def with_authorizations(query) do
    from q in query, preload: [authorizations: :user]
  end  
end