defmodule LiveviewWeb.UserJSON do

  def show(%{user: user}) do
    %{user: data(user)}
  end

  def user_json(counterpart) do
    data(counterpart)
  end

  defp data(user) do
    hash_email = :crypto.hash(:md5, user.email) |> Base.encode16 |> String.downcase()
    avatar_url = "http://www.gravatar.com/avatar/#{hash_email}"

    %{
      id: user.id,
      username: user.name,
      avatarURL: avatar_url
    }
  end
end
