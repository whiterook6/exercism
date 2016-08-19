defmodule Bob do
  def hey(input) do
    cond do
      String.at(input, -1) == "?" ->
        "Sure."
      String.strip(input) == "" ->
        "Fine. Be that way!"
      String.upcase(input) == input and String.downcase(input) != input ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end
end
