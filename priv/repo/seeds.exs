# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Liveview.Repo.insert!(%Liveview.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Liveview.Repo.insert!(%Liveview.Accounts.User{name: "Soniya", email: "maharjansoniya36@gmail.com", password_hash: "soniya123"})

alias Liveview.{Chat, Repo, Accounts}
alias Liveview.Accounts.User
alias Liveview.Chat.{Room, Message}

# Create a new room
case Chat.create_room() do
  {:ok, room} ->
    IO.puts("Room created successfully.")

    # Fetch the first user from the table
    me = Repo.one(User)
    if is_nil(me) do
      IO.puts("No user found. Please add a user first.")
      System.halt(1)
    end

    # Create a counterpart user
    case Accounts.create_user(%{
      "name" => "bob",
      "email" => "bob@example.com",
      "password_hash" => "test"
    }) do
      {:ok, counterpart} ->
        IO.puts("Counterpart user created successfully.")

        # Add myself as a room user
        case Chat.add_room_user(room, me) do
          {:ok, _} -> IO.puts("Added myself to the room.")
          {:error, reason} -> IO.puts("Failed to add myself to the room: #{reason}")
        end

        # Add counterpart as a room user
        case Chat.add_room_user(room, counterpart) do
          {:ok, _} -> IO.puts("Added counterpart to the room.")
          {:error, reason} -> IO.puts("Failed to add counterpart to the room: #{reason}")
        end

        # Add a message in the room
        case Chat.add_message(%{
          room: room,
          user: me,
          text: "Hello world!"
        }) do
          {:ok, _} -> IO.puts("Message added to the room.")
          {:error, reason} -> IO.puts("Failed to add message to the room: #{reason}")
        end

      {:error, reason} ->
        IO.puts("Failed to create counterpart user: #{reason}")
    end

  {:error, reason} ->
    IO.puts("Failed to create room: #{reason}")
end
