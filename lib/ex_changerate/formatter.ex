defmodule ExChangerate.Formatter do
  @moduledoc false

  alias ExChangerate.Filterer

  def format(endpoint), do: base(endpoint)
  def format(endpoint, []), do: base(endpoint) <> "?"
  def format(endpoint, date: date), do: base(endpoint) <> date
  def format(endpoint, base: base), do: base(endpoint) <> "?" <> "base=" <> base
  def format(endpoint, base: base, symbols: symbols),
    do: base(endpoint) <> "?" <> "base=" <> base <> "&" <> "symbols=" <> symbols

  def format(endpoint, from: from, to: to),
    do: base(endpoint) <> "?" <> "from=" <> from <> "&" <> "to=" <> to

  def format(endpoint, start_date: start_date, end_date: end_date),
    do: base(endpoint) <> "?" <> "start_date=" <> start_date <> "&" <> "end_date=" <> end_date

  def format_optionals(optionals) do
    %{options: optionals} = Keyword.merge([options: ""], optionals) |> Enum.into(%{})

    "&" <> optionals
  end

  def format_optionals(optionals, keywords) do
    prepared =
      Enum.into(Filterer.filter_params(optionals, keywords), %{})
      |> Enum.map(fn {x, y} -> "#{x}=#{y}" end)
      |> Enum.map_join("&", & &1)

    "&" <> prepared
  end

  defp base(endpoint) do
    ExChangerate.base_url() <> endpoint
  end
end
