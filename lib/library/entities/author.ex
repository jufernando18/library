defmodule Author do
  @enforce_keys [:name, :lastname]
  defstruct [:id, :name, :lastname]
end
