defmodule ExChangerate.ConvertCurrencyTest do
  @moduledoc false
  use ExUnit.Case, async: true

  test "invalid request: no parameters" do
    {:error, state} = ExChangerate.ConvertCurrency.get()

    assert(state, "Missing required paramaters: from, to")
  end

  test "valid request: with required paramaters separated with coma" do
    {:ok, state} = ExChangerate.ConvertCurrency.get(from: "USD", to: "CZK")

    {:ok, query} = Map.fetch(state, "query")
    amount = Map.get(query, "amount")
    from = Map.get(query, "from")
    to = Map.get(query, "to")

    assert(amount, "1")
    assert(from, "USD")
    assert(to, "CZK")
  end

  test "valid request: with required paramaters in brackets" do
    {:ok, state} = ExChangerate.ConvertCurrency.get([from: "CNY", to: "JPY"])

    {:ok, query} = Map.fetch(state, "query")
    amount = Map.get(query, "amount")
    from = Map.get(query, "from")
    to = Map.get(query, "to")

    assert(amount, "1")
    assert(from, "CNY")
    assert(to, "JPY")
  end

  test "valid request: with single optional parameter" do
    {:ok, state} = ExChangerate.ConvertCurrency.get([from: "BTC", to: "USD"], amount: "2")

    {:ok, query} = Map.fetch(state, "query")
    amount = Map.get(query, "amount")
    from = Map.get(query, "from")
    to = Map.get(query, "to")

    assert(amount, "2")
    assert(from, "BTC")
    assert(to, "USD")
  end

  test "valid request: with options parameter" do
    {:ok, state} =
      ExChangerate.ConvertCurrency.get([from: "UAH", to: "HUF"], options: "date=2020-04-04")

    {:ok, date} = Map.fetch(state, "date")
    {:ok, historical} = Map.fetch(state, "historical")

    assert(date, "2020-04-04")
    assert(Kernel.to_string(historical), "true")
  end
end
