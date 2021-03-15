defmodule Library.RepoMongoImpl do
  defstruct [:conn]

  def create() do
    {:ok, conn} = Mongo.start_link(Application.fetch_env!(:library, :mongo))
    %__MODULE__{conn: conn}
  end
end

defimpl Library.Repo, for: Library.RepoMongoImpl do
  def insert_one(%{conn: conn}, table, %{} = data) do
    Mongo.insert_one(conn, table, data)
  end

  def find(%{conn: conn}, table, %{} = filter \\ %{}) do
    Mongo.find(conn, table, filter) |> Enum.to_list()
  end

  def update_many(%{conn: conn}, table, %{} = filter, %{} = data, opts \\ [upsert: false]) do
    Mongo.update_many(conn, table, filter, %{"$set": data}, opts)
  end

  def delete_many(%{conn: conn}, table, %{} = filter) do
    Mongo.delete_many(conn, table, filter)
  end

  def id_from_string(%{conn: _conn}, id) when is_binary(id) do
    {_, id_bin} = Base.decode16(id, case: :mixed)
    %BSON.ObjectId{value: id_bin}
  end
end
