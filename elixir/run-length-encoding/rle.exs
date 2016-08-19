defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""


  def encode(string) do
    [ head | tail ] = String.split(string, "")
    encode_chunk(tail, head, 1)
  end



  def encode_chunk([], _ , count ) do
    ""
  end

  def encode_chunk([previous | tail], previous, count) do
    encode_chunk(tail, previous, count + 1)
  end

  def encode_chunk([new_char | tail], previous, count) do
    to_string(count) <> previous <> encode_chunk(tail, new_char, 1)
  end



  @spec decode(String.t) :: String.t
  #def decode(""), do: ""
  def decode([]), do: ""
  
  def decode([count, character | tail]) do
    String.duplicate(character, String.to_integer(count)) <> decode(tail)
  end

  def decode(string) do
    [count, character | tail] = Regex.split(~r/([A-z]+)/, string, include_captures: true, trim: true)
    String.duplicate(character, String.to_integer(count)) <> decode(tail)
  end
end
