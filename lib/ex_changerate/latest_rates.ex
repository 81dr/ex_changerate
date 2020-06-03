defmodule ExChangerate.LatestRates do
  @moduledoc """
  Enables the use of Latest Rates Endpoint

  *Note from documentation: Get the latest foreign exchange reference rates. Latest endpoint will return exchange rate data updated on daily basis.*
  """
  @endpoint "/latest"

  alias ExChangerate.Handler

  def get(options, params), do: fetch(options, params)
  def get(options), do: fetch(options)
  def get, do: fetch()

  defp fetch(options, params), do: Handler.handle(@endpoint, options, params, keywords())
  defp fetch(options), do: Handler.handle(@endpoint, options)
  defp fetch, do: Handler.handle(@endpoint)

  defp keywords, do: [:base, :symbols, :amount, :callback, :places, :format, :source]
end
