defmodule LiveviewWeb.RoomController do
  use LiveviewWeb, :controller

  alias Liveview.Chat
  alias Liveview.Repo
  alias Liveview.Accounts.User

  def index(conn, _params) do
    # user = Guardian.Plug.current_resource(conn)
    # IO.inspect user

    [me | _others] = Repo.all(User)
    IO.inspect me

    rooms = Chat.list_rooms()
    IO.inspect(rooms)
    render(conn, "index.json", rooms: rooms, me: me)
  end

end
