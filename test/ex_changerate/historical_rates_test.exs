defmodule ExChangerate.HistoricalRatesTest do
  @moduledoc false
  use ExUnit.Case, async: true

  test "valid request: with date" do
    {:ok, state} = ExChangerate.HistoricalRates.get(date: "2020-01-01")

    {:ok, base} = Map.fetch(state, "base")

    assert(base, "EUR")
  end

  test "invalid request: no date" do
    {:error, state} = ExChangerate.HistoricalRates.get()

    assert(state, "Missing required parameter: date")
  end

  test "valid request: with date and options parameter" do
    {:ok, state} = ExChangerate.HistoricalRates.get([date: "2020-02-05"], options: "base=CHF")

    {:ok, base} = Map.fetch(state, "base")

    assert(base, "CHF")
  end

  test "valid request: with date and single optional parameter" do
    {:ok, state} = ExChangerate.HistoricalRates.get([date: "2020-03-03"], base: "CZK")

    {:ok, base} = Map.fetch(state, "base")

    assert(base, "CZK")
  end

  test "valid request: with date and multiple optional parameters" do
    {:ok, state} =
      ExChangerate.HistoricalRates.get([date: "2020-03-03"], base: "CZK", symbols: "SEK")

    {:ok, base} = Map.fetch(state, "base")
    {:ok, rates} = Map.fetch(state, "rates")

    assert(Kernel.to_string(map_size(rates)), "1")
    assert(base, "CZK")
  end
end
