defmodule Liveview.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "messages" do
    field :text, :string

    belongs_to :room, Liveview.Chat.Room, type: :binary_id
    belongs_to :user, Liveview.Accounts.User, type: :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
