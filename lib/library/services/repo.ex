defprotocol Library.Repo do
  def insert_one(repo_handler, table, data)
  def find(repo_handler, table, filter \\ %{})
  def update_many(repo_handler, table, filter, data, opts \\ [upsert: false])
  def delete_many(repo_handler, table, filter)
  def id_from_string(repo_handler, id)
end
