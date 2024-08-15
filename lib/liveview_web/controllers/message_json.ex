defmodule LiveviewWeb.MessageJSON do

  def message(message, %{me: me}) do

    IO.inspect(me)
    %{
      id: message.id,
      text: message.text,
      sentAt: message.inserted_at
    }
  end
end
