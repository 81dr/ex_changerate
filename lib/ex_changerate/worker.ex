defmodule ExChangerate.Worker do
  @moduledoc false
  def call(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body, headers: headers, status_code: 200}} ->
        if content_type_header(headers) == "application/json; charset=utf-8" do
          case Poison.decode(body) do
            {:ok, decoded} ->
              content_type_header(headers)
              {:ok, decoded}

            {:error, error} ->
              {:error, error}
          end
        else
          {:error, "Only JSON format is currently supported."}
        end

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, status_code}

      {:error, error} ->
        {:error, error}
    end
  end

  defp content_type_header(response) do
    response
    |> Enum.map(fn x ->
      if List.first(Tuple.to_list(x)) == "Content-Type" do
        Tuple.to_list(x)
      end
    end)
    |> Enum.find(fn x -> x != nil end)
    |> List.last()
  end
end
