defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    unless Enum.member?(@nucleotides, nucleotide) do
      raise ArgumentError
    else
      Enum.count(Enum.filter(strand, fn(x) ->
        if Enum.member?(@nucleotides, x) do
          x == nucleotide
        else
          raise ArgumentError
        end
      end))
    end
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.reduce(strand, %{?A => 0, ?C => 0, ?T => 0, ?G => 0}, fn(nucleotide, acc) ->
      if Enum.member?(@nucleotides, nucleotide) do
        Map.update(acc, nucleotide, 1, fn(a) -> a+1 end)
      else
        raise ArgumentError
      end
    end)
  end
end
