defmodule ExChangerate.Timeseries do
  @moduledoc """
  Enables the use of Timeseries Endpoint

  *Note from documentation: Timeseries endpoint are for daily historical rates between two dates of your choice, with a maximum time frame of 365 days.*
  """
  @endpoint "/timeseries"

  alias ExChangerate.Handler

  def get(options, params), do: fetch(options, params)
  def get(options), do: fetch(options)
  def get, do: {:error, "Missing required parameters: start_date, end_date"}

  defp fetch(options, params), do: Handler.handle(@endpoint, options, params, keywords())
  defp fetch(options), do: Handler.handle(@endpoint, options)

  defp keywords, do: [:base, :symbols, :amount, :callback, :places, :format, :source]
end
