defmodule Liveview.Chat.Room do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "rooms" do

    has_many :messages, Liveview.Chat.Message #for preloading

    many_to_many :users, Liveview.Accounts.User, join_through: "room_users"
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [])
    |> validate_required([])
  end
end
