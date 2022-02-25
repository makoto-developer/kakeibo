defmodule KakeiboWeb.BalanceControllerTest do
  use KakeiboWeb.ConnCase

  import Kakeibo.AccountsFixtures

  alias Kakeibo.Accounts.Balance

  @create_attrs %{
    day: ~D[2022-02-24],
    expense: 42,
    income: 42,
    title: "some title",
    who: "some who"
  }
  @update_attrs %{
    day: ~D[2022-02-25],
    expense: 43,
    income: 43,
    title: "some updated title",
    who: "some updated who"
  }
  @invalid_attrs %{day: nil, expense: nil, income: nil, title: nil, who: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all balance", %{conn: conn} do
      conn = get(conn, Routes.balance_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create balance" do
    test "renders balance when data is valid", %{conn: conn} do
      conn = post(conn, Routes.balance_path(conn, :create), balance: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.balance_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "day" => "2022-02-24",
               "expense" => 42,
               "income" => 42,
               "title" => "some title",
               "who" => "some who"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.balance_path(conn, :create), balance: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update balance" do
    setup [:create_balance]

    test "renders balance when data is valid", %{conn: conn, balance: %Balance{id: id} = balance} do
      conn = put(conn, Routes.balance_path(conn, :update, balance), balance: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.balance_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "day" => "2022-02-25",
               "expense" => 43,
               "income" => 43,
               "title" => "some updated title",
               "who" => "some updated who"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, balance: balance} do
      conn = put(conn, Routes.balance_path(conn, :update, balance), balance: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete balance" do
    setup [:create_balance]

    test "deletes chosen balance", %{conn: conn, balance: balance} do
      conn = delete(conn, Routes.balance_path(conn, :delete, balance))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.balance_path(conn, :show, balance))
      end
    end
  end

  defp create_balance(_) do
    balance = balance_fixture()
    %{balance: balance}
  end
end
