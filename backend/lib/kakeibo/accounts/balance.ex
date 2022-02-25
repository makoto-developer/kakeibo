defmodule Kakeibo.Accounts.Balance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "balance" do
    field :day, :date
    field :expense, :integer
    field :income, :integer
    field :title, :string
    field :who, :string

    timestamps()
  end

  @doc false
  def changeset(balance, attrs) do
    balance
    |> cast(attrs, [:day, :title, :expense, :income, :who])
    |> validate_required([:day, :title, :expense, :income, :who])
  end
end
