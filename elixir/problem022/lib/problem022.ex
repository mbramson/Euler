defmodule Problem022 do


  @doc """
  Streams in the given file and produces a map for each word in the file where
  the key is the name score. 
  
  The name score of a word is the sum of the corresponding alphabet position 
  for each letter (a is 1, c is 3, etc.) multiplied by the words overall 
  alphabetical position among all other words in the source file.
  
  TODO: IMPLEMENT
  """
  def process_names(file) do
    File.open!(file)
    |> IO.stream(:line)
    |> IO.inspect
  end

  @doc """
  Returns the sum of the corresponding alphabet position for each letter in
  the word parameter.

  Example:
  score_word("cat") is 24 (3 + 1 + 20)
  """
  def score_word(word) do
    word
    |> String.codepoints
    |> Enum.reduce(0, fn l, acc -> acc + single_letter_score!(l) end)
  end

  defp single_letter_score!(letter) do
    case letter do
      "" -> 0
      "a" -> 1
      _ -> raise "invalid character for single_letter_score"
    end
  end
  
end
