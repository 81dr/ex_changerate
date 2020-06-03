defmodule ExChangerate.SupportedSymbols do
  @moduledoc """
  Enables the use of Supported Symbols Endpoint

  *Note from documentaion: API comes with a constantly updated endpoint returning all available currencies. To access this list, make a request to the API's symbols endpoint.*
  """
  @endpoint "/symbols"

  alias ExChangerate.Handler

  def get(params), do: fetch(params)
  def get, do: fetch()

  defp fetch(params), do: Handler.handle(@endpoint, params, keywords())
  defp fetch, do: Handler.handle(@endpoint)

  defp keywords, do: [:callback, :format]
end
