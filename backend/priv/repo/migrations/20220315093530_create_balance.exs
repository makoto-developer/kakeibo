defmodule Kakeibo.Repo.Migrations.CreateBalance do
  use Ecto.Migration

  def change do
    create table(:balance) do
      add :day, :date
      add :title, :string
      add :expense, :integer
      add :income, :integer
      add :method, :string
      add :who, :string

      timestamps()
    end
  end
end
