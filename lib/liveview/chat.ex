defmodule Liveview.Chat do
  alias Liveview.Chat.{Message, Room, RoomUser}
  alias Liveview.Repo
  alias Liveview.Accounts.User

  def list_rooms do
    Repo.all(Room) |> Repo.preload(:messages) |> Repo.preload(:users)
  end

  def create_room() do
    %Room{}
    |> Repo.insert()
  end

  def add_room_user(%Room{id: room_id}, %User{id: user_id}) do
    %RoomUser{
      room_id: room_id,
      user_id: user_id
    }
    |> Repo.insert()
  end

  def add_message(%{room: %Room{id: room_id}, user: %User{id: user_id}, text: text}) do
    %Message{
      room_id: room_id,
      user_id: user_id,
      text: text
    }
    |> Repo.insert()
  end
end
