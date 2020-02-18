defmodule Portafolio.Repo.Migrations.CreateDataModel do
  use Ecto.Migration

  def change do
    create table(:data_model) do
      add :height, :integer
      add :weight, :integer
      add :waist_size, :integer
      add :hip_size, :integer
      add :chest_size, :integer
      add :bust_size, :integer
      add :skin_type, :string
      add :body_size, :integer
      add :body_type, :string
      add :ethnicity, :string
      add :nationality, :string
      add :eye_color, :string
      add :lip_type, :string
      add :hair_color, :string
      add :hair_type, :string
      add :hair_style, :string
      add :rating, :integer
      add :rangking, :integer
      add :level, :integer
      add :user_id, references(:user, on_delete: :nothing)

      timestamps()
    end

    create index(:data_model, [:user_id])
  end
end
