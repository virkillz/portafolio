defmodule Portafolio.Metadata.DataModel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "data_model" do
    field(:body_size, :integer)
    field(:body_type, :string)
    field(:bust_size, :integer)
    field(:chest_size, :integer)
    field(:ethnicity, :string)
    field(:eye_color, :string)
    field(:hair_color, :string)
    field(:hair_style, :string)
    field(:hair_type, :string)
    field(:height, :integer)
    field(:hip_size, :integer)
    field(:level, :integer)
    field(:lip_type, :string)
    field(:nationality, :string)
    field(:rangking, :integer)
    field(:rating, :integer)
    field(:skin_type, :string)
    field(:waist_size, :integer)
    field(:weight, :integer)
    field(:user_id, :id)

    timestamps()
  end

  @doc false
  def changeset(data_model, attrs) do
    data_model
    |> cast(attrs, [
      :height,
      :weight,
      :waist_size,
      :hip_size,
      :chest_size,
      :bust_size,
      :skin_type,
      :body_size,
      :body_type,
      :ethnicity,
      :nationality,
      :eye_color,
      :lip_type,
      :hair_color,
      :hair_type,
      :hair_style,
      :rating,
      :rangking,
      :level
    ])
  end
end
