defmodule ExChangerate.FluctuationTest do
  @moduledoc false
  use ExUnit.Case, async: true

  test "invalid request: no dates" do
    {:error, state} = ExChangerate.Fluctuation.get()

    assert(state, "Missing required parameters: start_date, end_date")
  end

  test "valid request: dates separated with coma" do
    {:ok, state} = ExChangerate.Fluctuation.get(start_date: "2020-01-01", end_date: "2020-01-02")

    {:ok, fluctuation} = Map.fetch(state, "fluctuation")
    {:ok, start_date} = Map.fetch(state, "start_date")

    assert(Kernel.to_string(fluctuation), "true")
    assert(start_date, "2020-01-01")
  end

  test "valid request: with dates and single optional parameter" do
    {:ok, state} =
      ExChangerate.Fluctuation.get([start_date: "2020-05-01", end_date: "2020-05-02"], base: "AUD")

    {:ok, rates} = Map.fetch(state, "rates")
    {:ok, start_date} = Map.fetch(state, "start_date")

    aud_change = Map.get(rates, "AUD") |> Map.get("change")
    aud_start_rate = Map.get(rates, "AUD") |> Map.get("start_rate")
    aud_end_rate = Map.get(rates, "AUD") |> Map.get("end_rate")

    assert(aud_change, "0")
    assert(aud_start_rate, "1")
    assert(aud_end_rate, "1")
    assert(start_date, "2020-05-01")
  end
end
