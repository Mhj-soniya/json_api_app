defmodule LiveviewWeb.RoomJSON do

  import LiveviewWeb.MessageJSON, only: [message: 2] # 2 is the number of parameters
  import LiveviewWeb.UserJSON, only: [user_json: 1] # 1 is the number of parameters

  def index(%{rooms: rooms, me: me}) do
    %{
      rooms: for(room <- rooms, do: room_json(room, %{me: me}))
    }
  end

  defp room_json(%{users: room_users} = room, %{me: me}) do
    # IO.inspect(room.messages)
    counterpart = get_counterpart(room_users, me)
    IO.inspect(counterpart, label: "counterpart")
    %{
      id: room.id,
      counterpart: user_json(counterpart),
      messages: Enum.map(room.messages, fn (message) -> message(message, %{me: me}) end)
    }
  end

  defp get_counterpart(users, me) do
    Enum.find(users, fn(user) -> user.id != me.id end)
  end
end
