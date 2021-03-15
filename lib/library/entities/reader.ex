defmodule Reader do
  @enforce_keys [:dni, :name, :last_name, :email]
  defstruct [:id, :dni, :name, :last_name, :email, :borrowed_books]
end
