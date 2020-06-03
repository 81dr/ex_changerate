defmodule ExChangerate.Filterer do
  @moduledoc false

  @doc """
  Filter unsupported parameters
  """
  def filter_params(allowed_params, actual_params) do
    filter(allowed_params, actual_params)
  end

  defp filter(allowed_params, actual_params) do
    Keyword.take(allowed_params, actual_params)
  end
end
