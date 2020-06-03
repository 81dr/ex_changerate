defmodule ExChangerate.SupportedSymbolsTest do
  @moduledoc false
  use ExUnit.Case, async: true

  test "valid request: defaults" do
    {:ok, state} = ExChangerate.SupportedSymbols.get()

    {:ok, symbols} = Map.fetch(state, "symbols")
    nok_code = Map.get(symbols, "NOK") |> Map.get("code")
    aud_description = Map.get(symbols, "AUD") |> Map.get("description")

    assert(nok_code, "NOK")
    assert(aud_description, "Australian Dollar")
  end

  test "valid request: with standard json format" do
    {:ok, state} = ExChangerate.SupportedSymbols.get(format: "json")

    {:ok, symbols} = Map.fetch(state, "symbols")
    chf_code = Map.get(symbols, "HUF") |> Map.get("code")
    uah_description = Map.get(symbols, "UAH") |> Map.get("description")

    assert(chf_code, "HUF")
    assert(uah_description, "Ukrainian Hryvnia")
  end

  test "invalid request: with unsupported xml format" do
    {:error, state} = ExChangerate.SupportedSymbols.get(format: "xml")

    assert(state, "Only JSON format is currently supported.")
  end
end
