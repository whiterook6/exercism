defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.split(string, ~r/\W/)
    |> Enum.map(fn(word) ->
      case word do
        "" -> ""
        word -> (word |> String.first |> String.upcase) <> (word |> String.slice(1..-1) |> String.replace(~r/[^A-Z]/, ""))
      end
    end) |> Enum.join("")

  end
end
