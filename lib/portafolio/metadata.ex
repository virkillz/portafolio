defmodule Portafolio.Metadata do
  @moduledoc """
  The Metadata context.
  """

  import Ecto.Query, warn: false
  alias Portafolio.Repo

  alias Portafolio.Metadata.DataModel
  alias Portafolio.Account.User

  @doc """
  Returns the list of data_model.

  ## Examples

      iex> list_data_model()
      [%DataModel{}, ...]

  """
  def list_data_model do
    query = from(u in User, where: u.role == "model")

    Repo.all(query)
  end

  @doc """
  Gets a single data_model.

  Raises `Ecto.NoResultsError` if the Data model does not exist.

  ## Examples

      iex> get_data_model!(123)
      %DataModel{}

      iex> get_data_model!(456)
      ** (Ecto.NoResultsError)

  """
  def get_data_model(id) do
    query = from(u in User, where: u.id == ^id)

    case Repo.one(query) do
      nil ->
        nil

      user ->
        query_model = from(d in DataModel, where: d.user_id == ^user.id)

        model_fetch = Repo.one(query_model)

        model = if is_nil(model_fetch), do: %DataModel{}, else: model_fetch

        %{user: user, model: model}
    end
  end

  def get_data_model!(id) do
    Repo.get!(DataModel, id)
  end

  @doc """
  Creates a data_model.

  ## Examples

      iex> create_data_model(%{field: value})
      {:ok, %DataModel{}}

      iex> create_data_model(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_data_model(attrs \\ %{}) do
    %DataModel{}
    |> DataModel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a data_model.

  ## Examples

      iex> update_data_model(data_model, %{field: new_value})
      {:ok, %DataModel{}}

      iex> update_data_model(data_model, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_data_model(%DataModel{} = data_model, attrs) do
    data_model
    |> DataModel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a DataModel.

  ## Examples

      iex> delete_data_model(data_model)
      {:ok, %DataModel{}}

      iex> delete_data_model(data_model)
      {:error, %Ecto.Changeset{}}

  """
  def delete_data_model(%DataModel{} = data_model) do
    Repo.delete(data_model)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking data_model changes.

  ## Examples

      iex> change_data_model(data_model)
      %Ecto.Changeset{source: %DataModel{}}

  """
  def change_data_model(%DataModel{} = data_model) do
    DataModel.changeset(data_model, %{})
  end
end
