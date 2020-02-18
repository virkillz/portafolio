defmodule Portafolio.MetadataTest do
  use Portafolio.DataCase

  alias Portafolio.Metadata

  describe "data_model" do
    alias Portafolio.Metadata.DataModel

    @valid_attrs %{body_size: 42, body_type: "some body_type", bust_size: 42, chest_size: 42, ethnicity: "some ethnicity", eye_color: "some eye_color", hair_color: "some hair_color", hair_style: "some hair_style", hair_type: "some hair_type", height: 42, hip_size: 42, level: 42, lip_type: "some lip_type", nationality: "some nationality", rangking: 42, rating: 42, skin_type: "some skin_type", waist_size: 42, weight: 42}
    @update_attrs %{body_size: 43, body_type: "some updated body_type", bust_size: 43, chest_size: 43, ethnicity: "some updated ethnicity", eye_color: "some updated eye_color", hair_color: "some updated hair_color", hair_style: "some updated hair_style", hair_type: "some updated hair_type", height: 43, hip_size: 43, level: 43, lip_type: "some updated lip_type", nationality: "some updated nationality", rangking: 43, rating: 43, skin_type: "some updated skin_type", waist_size: 43, weight: 43}
    @invalid_attrs %{body_size: nil, body_type: nil, bust_size: nil, chest_size: nil, ethnicity: nil, eye_color: nil, hair_color: nil, hair_style: nil, hair_type: nil, height: nil, hip_size: nil, level: nil, lip_type: nil, nationality: nil, rangking: nil, rating: nil, skin_type: nil, waist_size: nil, weight: nil}

    def data_model_fixture(attrs \\ %{}) do
      {:ok, data_model} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Metadata.create_data_model()

      data_model
    end

    test "list_data_model/0 returns all data_model" do
      data_model = data_model_fixture()
      assert Metadata.list_data_model() == [data_model]
    end

    test "get_data_model!/1 returns the data_model with given id" do
      data_model = data_model_fixture()
      assert Metadata.get_data_model!(data_model.id) == data_model
    end

    test "create_data_model/1 with valid data creates a data_model" do
      assert {:ok, %DataModel{} = data_model} = Metadata.create_data_model(@valid_attrs)
      assert data_model.body_size == 42
      assert data_model.body_type == "some body_type"
      assert data_model.bust_size == 42
      assert data_model.chest_size == 42
      assert data_model.ethnicity == "some ethnicity"
      assert data_model.eye_color == "some eye_color"
      assert data_model.hair_color == "some hair_color"
      assert data_model.hair_style == "some hair_style"
      assert data_model.hair_type == "some hair_type"
      assert data_model.height == 42
      assert data_model.hip_size == 42
      assert data_model.level == 42
      assert data_model.lip_type == "some lip_type"
      assert data_model.nationality == "some nationality"
      assert data_model.rangking == 42
      assert data_model.rating == 42
      assert data_model.skin_type == "some skin_type"
      assert data_model.waist_size == 42
      assert data_model.weight == 42
    end

    test "create_data_model/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Metadata.create_data_model(@invalid_attrs)
    end

    test "update_data_model/2 with valid data updates the data_model" do
      data_model = data_model_fixture()
      assert {:ok, %DataModel{} = data_model} = Metadata.update_data_model(data_model, @update_attrs)
      assert data_model.body_size == 43
      assert data_model.body_type == "some updated body_type"
      assert data_model.bust_size == 43
      assert data_model.chest_size == 43
      assert data_model.ethnicity == "some updated ethnicity"
      assert data_model.eye_color == "some updated eye_color"
      assert data_model.hair_color == "some updated hair_color"
      assert data_model.hair_style == "some updated hair_style"
      assert data_model.hair_type == "some updated hair_type"
      assert data_model.height == 43
      assert data_model.hip_size == 43
      assert data_model.level == 43
      assert data_model.lip_type == "some updated lip_type"
      assert data_model.nationality == "some updated nationality"
      assert data_model.rangking == 43
      assert data_model.rating == 43
      assert data_model.skin_type == "some updated skin_type"
      assert data_model.waist_size == 43
      assert data_model.weight == 43
    end

    test "update_data_model/2 with invalid data returns error changeset" do
      data_model = data_model_fixture()
      assert {:error, %Ecto.Changeset{}} = Metadata.update_data_model(data_model, @invalid_attrs)
      assert data_model == Metadata.get_data_model!(data_model.id)
    end

    test "delete_data_model/1 deletes the data_model" do
      data_model = data_model_fixture()
      assert {:ok, %DataModel{}} = Metadata.delete_data_model(data_model)
      assert_raise Ecto.NoResultsError, fn -> Metadata.get_data_model!(data_model.id) end
    end

    test "change_data_model/1 returns a data_model changeset" do
      data_model = data_model_fixture()
      assert %Ecto.Changeset{} = Metadata.change_data_model(data_model)
    end
  end
end
