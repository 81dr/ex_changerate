# ex_changerate [![build](https://img.shields.io/travis/81dr/ex_changerate?style=flat-square)](https://travis-ci.org/81dr/ex_changerate) ![license](https://img.shields.io/github/license/81dr/ex_changerate?style=flat-square) [![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/81dr/ex_changerate/issues)

Exchangerate is a free exchange & crypto rates API, no access key is required.

Development is made in accordance to available endpoint specs (see https://exchangerate.host/#/docs)

By default, the `api_instance` configuration is pointing to the widely-available public instance.

## Examples

Get latest rates:
```elixir
iex> ExChangerate.LatestRates.get
```

Convert currencies
```elixir
iex> ExChangerate.ConvertCurrency.get(from: "BTC", to: "USD")
```

Get historical rates from given date:
```elixir
iex> ExChangerate.HistoricalRates.get(date: "2020-01-01")
```

Display timeseries within given date range:
```elixir
iex> ExChangerate.Timeseries.get(start_date: "2020-04-01", end_date: "2020-04-30")
```

Retrieve information about how currencies fluctuate:
```elixir
iex> ExChangerate.Fluctuation.get(start_date: "2020-05-01", end_date: "2020-05-05")
```

Access list of currently available currencies:
```elixir
iex> ExChangerate.SupportedSymbols.get
```
----

Additional parameters can be provided if they are supported by given endpoint. Below techniques can be used depending on preferences, e.g. for CurrencyConvert, comma separated:
```elixir
iex> ExChangerate.ConvertCurrency.get([from: "BTC", to: "USD"], amount: 2, date: "2020-04-04")
```
or equivalent by including `options`:
```elixir
iex> ExChangerate.ConvertCurrency.get([from: "BTC", to: "USD"], options: "amount=2&date=2020-04-04")
```

## Installation

```elixir
def deps do
  [
      {:ex_changerate, git: "git://github.com/81dr/ex_changerate.git"}
  ]
```
