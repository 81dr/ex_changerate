# Include aliases
alias ExChangerate.{
  LatestRates,
  ConvertCurrency,
  Fluctuation,
  Timeseries,
  HistoricalRates,
  SupportedSymbols
}

# Configure shell
default_prompt = "exchangerate>"
alive_prompt = "exchangerate>"
inspect_limit = 5_000
history_size = 100

IEx.configure [
  inspect: [limit: inspect_limit],
  history_size: history_size,
  default_prompt: default_prompt,
  alive_prompt: alive_prompt
]
