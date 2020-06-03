defmodule ExChangerate.LatestRatesTest do
  @moduledoc false
  use ExUnit.Case, async: true

  test "valid request: with defaults" do
    {:ok, state} = ExChangerate.LatestRates.get()

    {:ok, base} = Map.fetch(state, "base")

    assert(base, "EUR")
  end

  test "valid request: with base changed" do
    {:ok, state} = ExChangerate.LatestRates.get(base: "JPY")

    {:ok, base} = Map.fetch(state, "base")

    assert(base, "JPY")
  end

  test "valid request: with base and symbols changed" do
    {:ok, state} = ExChangerate.LatestRates.get(base: "CNY", symbols: "JPY")

    {:ok, base} = Map.fetch(state, "base")
    {:ok, rates} = Map.fetch(state, "rates")

    assert(Kernel.to_string(map_size(rates)), "1")
    assert(base, "CNY")
  end

  test "valid request: with options paramater" do
    {:ok, state} = ExChangerate.LatestRates.get([], options: "base=USD")

    {:ok, base} = Map.fetch(state, "base")

    assert(base, "USD")
  end

  test "valid request: with single optional paramater" do
    {:ok, state} = ExChangerate.LatestRates.get([], base: "SEK")

    {:ok, base} = Map.fetch(state, "base")

    assert(base, "SEK")
  end

  test "valid request: with single optional paramater and additional, unknown one to be ignored" do
    {:ok, state} = ExChangerate.LatestRates.get([], base: "CHF", test: "Test")

    {:ok, base} = Map.fetch(state, "base")

    assert(base, "CHF")
  end

  test "valid request: with multiple optional paramaters" do
    {:ok, state} = ExChangerate.LatestRates.get([], base: "SEK", symbols: "CZK")

    {:ok, base} = Map.fetch(state, "base")
    {:ok, rates} = Map.fetch(state, "rates")

    assert(Kernel.to_string(map_size(rates)), "1")
    assert(base, "SEK")
  end
end
