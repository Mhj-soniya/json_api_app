defmodule LiveviewWeb.FallbackController do
  use LiveviewWeb, :controller

  # alias LiveviewWeb.ErrorJSON

  # def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
  #   conn
  #   |> put_status(:not_found)
  #   |> put_view(json: LiveviewWeb.ErrorJSON)
  #   |> render("error.json", message: "The resource couldn't be found")
  # end

  def call(conn, nil) do
    conn
    |> put_status(:not_found)
    |> put_view(json: LiveviewWeb.ErrorJSON)
    |> render("error.json", message: "The resource couldn't be found")
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(json: LiveviewWeb.ErrorJSON)
    |> render("error.json", message: "The resource couldn't be found")
  end
end
