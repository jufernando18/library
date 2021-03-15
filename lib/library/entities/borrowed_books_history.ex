defmodule BorrowedBooksHistory do
  @enforce_keys [:copy_id, :reader_id, :status, :borrowed_date]
  defstruct [:id, :copy_id, :reader_id, :status, :borrowed_date, :return_date?]
end
