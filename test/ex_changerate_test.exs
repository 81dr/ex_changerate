defmodule ExChangerateTest do
  @moduledoc false

  use ExUnit.Case, async: true
  doctest ExChangerate.LatestRates
  doctest ExChangerate.ConvertCurrency
  doctest ExChangerate.Fluctuation
  doctest ExChangerate.Timeseries
  doctest ExChangerate.HistoricalRates
  doctest ExChangerate.SupportedSymbols
end
