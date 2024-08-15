defmodule Liveview.Repo.Migrations.CreateRoomUsers do
  use Ecto.Migration


  def change do
    create table(:room_users, primary_key: false) do
      add :id, :binary_id, primary_key: true

      add :room_id, references(:rooms, on_delete: :delete_all, type: :binary_id)
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:room_users, [:room_id, :user_id])

  end
end
