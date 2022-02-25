defmodule Kakeibo.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kakeibo.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name"
      })
      |> Kakeibo.Accounts.create_user()

    user
  end

  @doc """
  Generate a balance.
  """
  def balance_fixture(attrs \\ %{}) do
    {:ok, balance} =
      attrs
      |> Enum.into(%{
        day: ~D[2022-02-24],
        expense: 42,
        income: 42,
        title: "some title",
        who: "some who"
      })
      |> Kakeibo.Accounts.create_balance()

    balance
  end

  @doc """
  Generate a balance.
  """
  def balance_fixture(attrs \\ %{}) do
    {:ok, balance} =
      attrs
      |> Enum.into(%{
        method: "some method"
      })
      |> Kakeibo.Accounts.create_balance()

    balance
  end

  @doc """
  Generate a balance.
  """
  def balance_fixture(attrs \\ %{}) do
    {:ok, balance} =
      attrs
      |> Enum.into(%{
        day: ~D[2022-02-24],
        expense: 42,
        income: 42,
        method: "some method",
        title: "some title",
        who: "some who"
      })
      |> Kakeibo.Accounts.create_balance()

    balance
  end
end
