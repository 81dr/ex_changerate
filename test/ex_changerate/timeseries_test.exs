defmodule ExChangerate.TimeseriesTest do
  @moduledoc false
  use ExUnit.Case, async: true

  test "valid request: dates separated with coma" do
    {:ok, state} = ExChangerate.Timeseries.get(start_date: "2020-01-01", end_date: "2020-01-02")

    {:ok, base} = Map.fetch(state, "base")
    {:ok, start_date} = Map.fetch(state, "start_date")
    {:ok, end_date} = Map.fetch(state, "end_date")

    assert(base, "EUR")
    assert(start_date, "2020-01-01")
    assert(end_date, "2020-01-02")
  end

  test "valid request: dates in brackets with options parameter" do
    {:ok, state} =
      ExChangerate.Timeseries.get([start_date: "2020-02-01", end_date: "2020-02-02"],
        options: "base=USD"
      )

    {:ok, base} = Map.fetch(state, "base")
    {:ok, start_date} = Map.fetch(state, "start_date")
    {:ok, end_date} = Map.fetch(state, "end_date")

    assert(base, "USD")
    assert(start_date, "2020-02-01")
    assert(end_date, "2020-02-02")
  end

  test "valid request: dates in brackets with single optional parameter" do
    {:ok, state} =
      ExChangerate.Timeseries.get([start_date: "2020-03-01", end_date: "2020-03-02"], base: "JPY")

    {:ok, base} = Map.fetch(state, "base")
    {:ok, start_date} = Map.fetch(state, "start_date")
    {:ok, end_date} = Map.fetch(state, "end_date")

    assert(base, "JPY")
    assert(start_date, "2020-03-01")
    assert(end_date, "2020-03-02")
  end

  test "valid request: dates in brackets with multiple optional parameters" do
    {:ok, state} =
      ExChangerate.Timeseries.get([start_date: "2020-03-01", end_date: "2020-03-02"],
        base: "CZK",
        symbols: "SEK"
      )

    {:ok, base} = Map.fetch(state, "base")
    {:ok, start_date} = Map.fetch(state, "start_date")
    {:ok, end_date} = Map.fetch(state, "end_date")
    {:ok, rates} = Map.fetch(state, "rates")

    assert(base, "CZK")
    assert(Kernel.to_string(map_size(rates)), "2")
    assert(start_date, "2020-03-01")
    assert(end_date, "2020-03-02")
  end

  test "invalid request: no dates" do
    {:error, state} = ExChangerate.Timeseries.get()

    assert(state, "Missing required parameters: start_date, end_date")
  end
end
