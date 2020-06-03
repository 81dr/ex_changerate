defmodule ExChangerate.ConvertCurrency do
  @moduledoc """
  Enables the use of Convert Endpoint

  *Note from documentation: Currency conversion endpoint, can be used to convert any amount from one currency to another. In order to convert currencies, please use the API's convert endpoint, append the from and to parameters and set them to your preferred base and target currency codes.*
  """
  @endpoint "/convert"

  alias ExChangerate.Handler

  def get(options, params), do: fetch(options, params)
  def get(options), do: fetch(options)
  def get, do: {:error, "Missing required paramaters: from, to"}

  defp fetch(options, params), do: Handler.handle(@endpoint, options, params, keywords())
  defp fetch(options), do: Handler.handle(@endpoint, options)

  defp keywords, do: [:date, :base, :symbols, :amount, :callback, :places, :format, :source]
end
