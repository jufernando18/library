defmodule BookCopy do
  @enforce_keys [:book_id, :status]
  defstruct [:id, :book_id, :reader_id, :status]
end
