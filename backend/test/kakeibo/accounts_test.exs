defmodule Kakeibo.AccountsTest do
  use Kakeibo.DataCase

  alias Kakeibo.Accounts

  describe "users" do
    alias Kakeibo.Accounts.User

    import Kakeibo.AccountsFixtures

    @invalid_attrs %{age: nil, name: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{age: 42, name: "some name"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.age == 42
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{age: 43, name: "some updated name"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.age == 43
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "balance" do
    alias Kakeibo.Accounts.Balance

    import Kakeibo.AccountsFixtures

    @invalid_attrs %{day: nil, expense: nil, income: nil, title: nil, who: nil}

    test "list_balance/0 returns all balance" do
      balance = balance_fixture()
      assert Accounts.list_balance() == [balance]
    end

    test "get_balance!/1 returns the balance with given id" do
      balance = balance_fixture()
      assert Accounts.get_balance!(balance.id) == balance
    end

    test "create_balance/1 with valid data creates a balance" do
      valid_attrs = %{day: ~D[2022-02-24], expense: 42, income: 42, title: "some title", who: "some who"}

      assert {:ok, %Balance{} = balance} = Accounts.create_balance(valid_attrs)
      assert balance.day == ~D[2022-02-24]
      assert balance.expense == 42
      assert balance.income == 42
      assert balance.title == "some title"
      assert balance.who == "some who"
    end

    test "create_balance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_balance(@invalid_attrs)
    end

    test "update_balance/2 with valid data updates the balance" do
      balance = balance_fixture()
      update_attrs = %{day: ~D[2022-02-25], expense: 43, income: 43, title: "some updated title", who: "some updated who"}

      assert {:ok, %Balance{} = balance} = Accounts.update_balance(balance, update_attrs)
      assert balance.day == ~D[2022-02-25]
      assert balance.expense == 43
      assert balance.income == 43
      assert balance.title == "some updated title"
      assert balance.who == "some updated who"
    end

    test "update_balance/2 with invalid data returns error changeset" do
      balance = balance_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_balance(balance, @invalid_attrs)
      assert balance == Accounts.get_balance!(balance.id)
    end

    test "delete_balance/1 deletes the balance" do
      balance = balance_fixture()
      assert {:ok, %Balance{}} = Accounts.delete_balance(balance)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_balance!(balance.id) end
    end

    test "change_balance/1 returns a balance changeset" do
      balance = balance_fixture()
      assert %Ecto.Changeset{} = Accounts.change_balance(balance)
    end
  end

  describe "balance" do
    alias Kakeibo.Accounts.Balance

    import Kakeibo.AccountsFixtures

    @invalid_attrs %{method: nil}

    test "list_balance/0 returns all balance" do
      balance = balance_fixture()
      assert Accounts.list_balance() == [balance]
    end

    test "get_balance!/1 returns the balance with given id" do
      balance = balance_fixture()
      assert Accounts.get_balance!(balance.id) == balance
    end

    test "create_balance/1 with valid data creates a balance" do
      valid_attrs = %{method: "some method"}

      assert {:ok, %Balance{} = balance} = Accounts.create_balance(valid_attrs)
      assert balance.method == "some method"
    end

    test "create_balance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_balance(@invalid_attrs)
    end

    test "update_balance/2 with valid data updates the balance" do
      balance = balance_fixture()
      update_attrs = %{method: "some updated method"}

      assert {:ok, %Balance{} = balance} = Accounts.update_balance(balance, update_attrs)
      assert balance.method == "some updated method"
    end

    test "update_balance/2 with invalid data returns error changeset" do
      balance = balance_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_balance(balance, @invalid_attrs)
      assert balance == Accounts.get_balance!(balance.id)
    end

    test "delete_balance/1 deletes the balance" do
      balance = balance_fixture()
      assert {:ok, %Balance{}} = Accounts.delete_balance(balance)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_balance!(balance.id) end
    end

    test "change_balance/1 returns a balance changeset" do
      balance = balance_fixture()
      assert %Ecto.Changeset{} = Accounts.change_balance(balance)
    end
  end

  describe "balance" do
    alias Kakeibo.Accounts.Balance

    import Kakeibo.AccountsFixtures

    @invalid_attrs %{day: nil, expense: nil, income: nil, method: nil, title: nil, who: nil}

    test "list_balance/0 returns all balance" do
      balance = balance_fixture()
      assert Accounts.list_balance() == [balance]
    end

    test "get_balance!/1 returns the balance with given id" do
      balance = balance_fixture()
      assert Accounts.get_balance!(balance.id) == balance
    end

    test "create_balance/1 with valid data creates a balance" do
      valid_attrs = %{day: ~D[2022-02-24], expense: 42, income: 42, method: "some method", title: "some title", who: "some who"}

      assert {:ok, %Balance{} = balance} = Accounts.create_balance(valid_attrs)
      assert balance.day == ~D[2022-02-24]
      assert balance.expense == 42
      assert balance.income == 42
      assert balance.method == "some method"
      assert balance.title == "some title"
      assert balance.who == "some who"
    end

    test "create_balance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_balance(@invalid_attrs)
    end

    test "update_balance/2 with valid data updates the balance" do
      balance = balance_fixture()
      update_attrs = %{day: ~D[2022-02-25], expense: 43, income: 43, method: "some updated method", title: "some updated title", who: "some updated who"}

      assert {:ok, %Balance{} = balance} = Accounts.update_balance(balance, update_attrs)
      assert balance.day == ~D[2022-02-25]
      assert balance.expense == 43
      assert balance.income == 43
      assert balance.method == "some updated method"
      assert balance.title == "some updated title"
      assert balance.who == "some updated who"
    end

    test "update_balance/2 with invalid data returns error changeset" do
      balance = balance_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_balance(balance, @invalid_attrs)
      assert balance == Accounts.get_balance!(balance.id)
    end

    test "delete_balance/1 deletes the balance" do
      balance = balance_fixture()
      assert {:ok, %Balance{}} = Accounts.delete_balance(balance)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_balance!(balance.id) end
    end

    test "change_balance/1 returns a balance changeset" do
      balance = balance_fixture()
      assert %Ecto.Changeset{} = Accounts.change_balance(balance)
    end
  end

  describe "balance" do
    alias Kakeibo.Accounts.Balance

    import Kakeibo.AccountsFixtures

    @invalid_attrs %{day: nil, expense: nil, income: nil, method: nil, title: nil, who: nil}

    test "list_balance/0 returns all balance" do
      balance = balance_fixture()
      assert Accounts.list_balance() == [balance]
    end

    test "get_balance!/1 returns the balance with given id" do
      balance = balance_fixture()
      assert Accounts.get_balance!(balance.id) == balance
    end

    test "create_balance/1 with valid data creates a balance" do
      valid_attrs = %{day: ~D[2022-03-14], expense: 42, income: 42, method: "some method", title: "some title", who: "some who"}

      assert {:ok, %Balance{} = balance} = Accounts.create_balance(valid_attrs)
      assert balance.day == ~D[2022-03-14]
      assert balance.expense == 42
      assert balance.income == 42
      assert balance.method == "some method"
      assert balance.title == "some title"
      assert balance.who == "some who"
    end

    test "create_balance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_balance(@invalid_attrs)
    end

    test "update_balance/2 with valid data updates the balance" do
      balance = balance_fixture()
      update_attrs = %{day: ~D[2022-03-15], expense: 43, income: 43, method: "some updated method", title: "some updated title", who: "some updated who"}

      assert {:ok, %Balance{} = balance} = Accounts.update_balance(balance, update_attrs)
      assert balance.day == ~D[2022-03-15]
      assert balance.expense == 43
      assert balance.income == 43
      assert balance.method == "some updated method"
      assert balance.title == "some updated title"
      assert balance.who == "some updated who"
    end

    test "update_balance/2 with invalid data returns error changeset" do
      balance = balance_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_balance(balance, @invalid_attrs)
      assert balance == Accounts.get_balance!(balance.id)
    end

    test "delete_balance/1 deletes the balance" do
      balance = balance_fixture()
      assert {:ok, %Balance{}} = Accounts.delete_balance(balance)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_balance!(balance.id) end
    end

    test "change_balance/1 returns a balance changeset" do
      balance = balance_fixture()
      assert %Ecto.Changeset{} = Accounts.change_balance(balance)
    end
  end
end
