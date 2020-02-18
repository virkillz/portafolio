defmodule PortafolioWeb.DataModelController do
  use PortafolioWeb, :controller

  alias Portafolio.Account
  alias Portafolio.Account.User
  alias Portafolio.Metadata
  alias Portafolio.Metadata.DataModel

  def index(conn, _params) do
    data_model = Metadata.list_data_model() |> IO.inspect()
    render(conn, "index.html", data_model: data_model)
  end

  def new(conn, _params) do
    changeset = Account.change_user(%User{})
    render(conn, "new_model.html", changeset: changeset)
  end

  def create(conn, %{"user" => data_model_params}) do
    params = Map.put(data_model_params, "role", "model")

    case Account.create_model(params) do
      {:ok, model} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: data_model_path(conn, :show, model))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        render(conn, "new_model.html", changeset: changeset)
    end

    # text(conn, "ok")
    # case Metadata.create_data_model(data_model_params) do
    #   {:ok, data_model} ->
    #     conn
    #     |> put_flash(:info, "Data model created successfully.")
    #     |> redirect(to: data_model_path(conn, :show, data_model))

    #   {:error, %Ecto.Changeset{} = changeset} ->
    #     render(conn, "new.html", changeset: changeset)
    # end
  end

  def show(conn, %{"id" => id}) do
    data_model = Metadata.get_data_model(id) |> IO.inspect()
    render(conn, "show_model.html", data_model: data_model)
  end

  def edit(conn, %{"id" => id}) do
    data_model = Metadata.get_data_model!(id)
    changeset = Metadata.change_data_model(data_model)
    render(conn, "edit.html", data_model: data_model, changeset: changeset)
  end

  def update(conn, %{"id" => id, "data_model" => data_model_params}) do
    data_model = Metadata.get_data_model!(id)

    case Metadata.update_data_model(data_model, data_model_params) do
      {:ok, data_model} ->
        conn
        |> put_flash(:info, "Data model updated successfully.")
        |> redirect(to: data_model_path(conn, :show, data_model))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", data_model: data_model, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    data_model = Metadata.get_data_model!(id)
    {:ok, _data_model} = Metadata.delete_data_model(data_model)

    conn
    |> put_flash(:info, "Data model deleted successfully.")
    |> redirect(to: data_model_path(conn, :index))
  end
end
