defmodule KakeiboWeb.BalanceController do
  use KakeiboWeb, :controller

  alias Kakeibo.Accounts
  alias Kakeibo.Accounts.Balance

  action_fallback KakeiboWeb.FallbackController

  def index(conn, _params) do
    balance = Accounts.list_balance()
    render(conn, "index.json", balance: balance)
  end

  def create(conn, %{"balance" => balance_params}) do
    with {:ok, %Balance{} = balance} <- Accounts.create_balance(balance_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.balance_path(conn, :show, balance))
      |> render("show.json", balance: balance)
    end
  end

  def show(conn, %{"id" => id}) do
    balance = Accounts.get_balance!(id)
    render(conn, "show.json", balance: balance)
  end

  def update(conn, %{"id" => id, "balance" => balance_params}) do
    balance = Accounts.get_balance!(id)

    with {:ok, %Balance{} = balance} <- Accounts.update_balance(balance, balance_params) do
      render(conn, "show.json", balance: balance)
    end
  end

  def delete(conn, %{"id" => id}) do
    balance = Accounts.get_balance!(id)

    with {:ok, %Balance{}} <- Accounts.delete_balance(balance) do
      send_resp(conn, :no_content, "")
    end
  end
end
