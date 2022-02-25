defmodule KakeiboWeb.BalanceView do
  use KakeiboWeb, :view
  alias KakeiboWeb.BalanceView

  def render("index.json", %{balance: balance}) do
    %{data: render_many(balance, BalanceView, "balance.json")}
  end

  def render("show.json", %{balance: balance}) do
    %{data: render_one(balance, BalanceView, "balance.json")}
  end

  def render("balance.json", %{balance: balance}) do
    %{
      id: balance.id,
      day: balance.day,
      title: balance.title,
      expense: balance.expense,
      income: balance.income,
      who: balance.who
    }
  end
end
