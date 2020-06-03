defmodule ExChangerate.Fluctuation do
  @moduledoc """
  Enables the use of Fluctuation Endpoint

  *Note from documentation: Using the fluctuation endpoint you will be able to retrieve information about how currencies fluctuate on a day-to-day basis. To use this feature, simply append a start_date and end_date and choose which currencies (symbols) you would like to query the API for. Please note that the maximum allowed timeframe is 365 days.*
  """
  @endpoint "/fluctuation"

  alias ExChangerate.Handler

  def get(options, params), do: fetch(options, params)
  def get(options), do: fetch(options)
  def get, do: {:error, "Missing required parameters: start_date, end_date"}

  defp fetch(options, params), do: Handler.handle(@endpoint, options, params, keywords())
  defp fetch(options), do: Handler.handle(@endpoint, options)

  defp keywords, do: [:base, :symbols, :amount, :callback, :places, :format, :source]
end
