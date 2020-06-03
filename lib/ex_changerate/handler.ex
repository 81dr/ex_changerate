defmodule ExChangerate.Handler do
  @moduledoc false

  alias ExChangerate.Formatter
  alias ExChangerate.Worker

  def handle(endpoint, options, params, keywords),
    do: do_handle(endpoint, options, params, keywords)

  def handle(endpoint, params, keywords), do: do_handle(endpoint, params, keywords)
  def handle(endpoint, options), do: do_handle(endpoint, options)
  def handle(endpoint), do: do_handle(endpoint)

  defp do_handle(endpoint, options, params, keywords) when length(options) != 0 do
    case elem(hd(params), 0) do
      :options ->
        [Formatter.format(endpoint, options), Formatter.format_optionals(params)]
        |> Enum.join()
        |> Worker.call()

      _ ->
        [Formatter.format(endpoint, options), Formatter.format_optionals(params, keywords)]
        |> Enum.join()
        |> Worker.call()
    end
  end

  defp do_handle(endpoint, options, params, keywords) when options == [] do
    case elem(hd(params), 0) do
      :options ->
        [Formatter.format(endpoint, []), Formatter.format_optionals(params)]
        |> Enum.join()
        |> Worker.call()

      _ ->
        [Formatter.format(endpoint, []), Formatter.format_optionals(params, keywords)]
        |> Enum.join()
        |> Worker.call()
    end
  end

  defp do_handle(endpoint, params, keywords) do
    [Formatter.format(endpoint, []), Formatter.format_optionals(params, keywords)]
    |> Enum.join()
    |> Worker.call()
  end

  defp do_handle(endpoint, options) do
    Formatter.format(endpoint, options)
    |> Worker.call()
  end

  defp do_handle(endpoint) do
    Formatter.format(endpoint)
    |> Worker.call()
  end
end
