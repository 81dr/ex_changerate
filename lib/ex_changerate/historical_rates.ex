defmodule ExChangerate.HistoricalRates do
  @moduledoc """
  Enables the use of Historical Rates Endpoint

  *Note from documentation: Historical rates are available for most currencies all the way back to the year of 1999. You can query the API for historical rates by appending a date (format YYYY-MM-DD) to the base URL.*
  """
  @endpoint "/"

  alias ExChangerate.Handler

  def get(options, params), do: fetch(options, params)
  def get(options), do: fetch(options)
  def get, do: {:error, "Missing required parameter: date"}

  defp fetch(options, params), do: Handler.handle(@endpoint, options, params, keywords())
  defp fetch(options), do: Handler.handle(@endpoint, options)

  defp keywords, do: [:base, :symbols, :amount, :callback, :places, :format, :source]
end
