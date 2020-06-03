defmodule ExChangerate.Common do
  @moduledoc false

  @doc """
  Base for all endpoints
  """
  def base(endpoint) do
    ExChangerate.base_url() <> endpoint
  end
end
