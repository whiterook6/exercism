defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    Enum.reduce(
      String.split(
        String.downcase(
          String.replace(
            sentence,
            ~r/[\s_&!?:@$%^,\.]+/,
            " "
          )
        )
      ),
      %{},
      fn(word, acc) ->
        Map.update(acc, word, 1, fn(a) -> a + 1 end)
      end
    )
  end
end
