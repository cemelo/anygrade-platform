defmodule Accounts.AccountsFactory do
  use ExMachina.Ecto, repo: Accounts.Repo

  def user_factory do
    %Accounts.User{
      name: "John Doe",
      email: sequence(:email, &"email-#{&1}@example.com"),
      roles: [build(:role)]
    }
  end

  def authorization_factory do
    %Accounts.Authorization{
      uid: sequence(:uid, &"uid-#{&1}"),
      user: build(:user),
      provider: "identity",
      token: Comeonin.Bcrypt.hashpwsalt("53cr3t")
    }
  end

  def role_factory do
    %Accounts.Role{
      name: "Sample Role",
      description: "Sample Role description"
    }
  end
  
  def with_authorization(%Accounts.User{} = user, opts \\ []) do
    opts = opts ++ [user: user, uid: user.email]
    insert(:authorization, opts)
  end
end