defmodule LiveviewWeb.UserController do
  use LiveviewWeb, :controller

  alias Liveview.Accounts
  # alias Liveview.Accounts.User

  action_fallback LiveviewWeb.FallbackController

  def show(conn, %{"id" => user_id}) do
    # case Accounts.get_user(user_id) do
    #   nil -> {:error, :not_found}
    #   user -> render(conn, "show.json", user: user)
    # end
    user = Accounts.get_user(user_id)
    if user do
      render(conn, "show.json", user: user)
    end
  end

end
