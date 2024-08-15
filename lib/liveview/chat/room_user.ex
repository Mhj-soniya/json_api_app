defmodule Liveview.Chat.RoomUser do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "room_users" do
    belongs_to :room, Liveview.Chat.Room, type: :binary_id
    belongs_to :user, Liveview.Accounts.User, type: :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(room_user, attrs) do
    room_user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
