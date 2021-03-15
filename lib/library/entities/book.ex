defmodule Book do
  @enforce_keys [:isbn, :title, :description, :published_date, :number_of_total_copies, :authors]
  defstruct [:id, :isbn, :title, :description, :published_date, :number_of_total_copies, :authors]
end
