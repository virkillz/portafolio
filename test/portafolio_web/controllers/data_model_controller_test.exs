defmodule PortafolioWeb.DataModelControllerTest do
  use PortafolioWeb.ConnCase

  alias Portafolio.Metadata

  @create_attrs %{body_size: 42, body_type: "some body_type", bust_size: 42, chest_size: 42, ethnicity: "some ethnicity", eye_color: "some eye_color", hair_color: "some hair_color", hair_style: "some hair_style", hair_type: "some hair_type", height: 42, hip_size: 42, level: 42, lip_type: "some lip_type", nationality: "some nationality", rangking: 42, rating: 42, skin_type: "some skin_type", waist_size: 42, weight: 42}
  @update_attrs %{body_size: 43, body_type: "some updated body_type", bust_size: 43, chest_size: 43, ethnicity: "some updated ethnicity", eye_color: "some updated eye_color", hair_color: "some updated hair_color", hair_style: "some updated hair_style", hair_type: "some updated hair_type", height: 43, hip_size: 43, level: 43, lip_type: "some updated lip_type", nationality: "some updated nationality", rangking: 43, rating: 43, skin_type: "some updated skin_type", waist_size: 43, weight: 43}
  @invalid_attrs %{body_size: nil, body_type: nil, bust_size: nil, chest_size: nil, ethnicity: nil, eye_color: nil, hair_color: nil, hair_style: nil, hair_type: nil, height: nil, hip_size: nil, level: nil, lip_type: nil, nationality: nil, rangking: nil, rating: nil, skin_type: nil, waist_size: nil, weight: nil}

  def fixture(:data_model) do
    {:ok, data_model} = Metadata.create_data_model(@create_attrs)
    data_model
  end

  describe "index" do
    test "lists all data_model", %{conn: conn} do
      conn = get conn, data_model_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Data model"
    end
  end

  describe "new data_model" do
    test "renders form", %{conn: conn} do
      conn = get conn, data_model_path(conn, :new)
      assert html_response(conn, 200) =~ "New Data model"
    end
  end

  describe "create data_model" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, data_model_path(conn, :create), data_model: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == data_model_path(conn, :show, id)

      conn = get conn, data_model_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Data model"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, data_model_path(conn, :create), data_model: @invalid_attrs
      assert html_response(conn, 200) =~ "New Data model"
    end
  end

  describe "edit data_model" do
    setup [:create_data_model]

    test "renders form for editing chosen data_model", %{conn: conn, data_model: data_model} do
      conn = get conn, data_model_path(conn, :edit, data_model)
      assert html_response(conn, 200) =~ "Edit Data model"
    end
  end

  describe "update data_model" do
    setup [:create_data_model]

    test "redirects when data is valid", %{conn: conn, data_model: data_model} do
      conn = put conn, data_model_path(conn, :update, data_model), data_model: @update_attrs
      assert redirected_to(conn) == data_model_path(conn, :show, data_model)

      conn = get conn, data_model_path(conn, :show, data_model)
      assert html_response(conn, 200) =~ "some updated body_type"
    end

    test "renders errors when data is invalid", %{conn: conn, data_model: data_model} do
      conn = put conn, data_model_path(conn, :update, data_model), data_model: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Data model"
    end
  end

  describe "delete data_model" do
    setup [:create_data_model]

    test "deletes chosen data_model", %{conn: conn, data_model: data_model} do
      conn = delete conn, data_model_path(conn, :delete, data_model)
      assert redirected_to(conn) == data_model_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, data_model_path(conn, :show, data_model)
      end
    end
  end

  defp create_data_model(_) do
    data_model = fixture(:data_model)
    {:ok, data_model: data_model}
  end
end
