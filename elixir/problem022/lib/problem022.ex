defmodule Problem022 do

  @scores %{a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: 9, j: 10, k: 11,
            l: 12, m: 13, n: 14, o: 15, p: 16, q: 17, r: 18, s: 19, t: 20,
            u: 21, v: 22, w: 23, x: 24, y: 25, z: 26}

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
    |> Enum.reduce(0, fn letter, acc -> 
          acc + single_letter_score(String.to_atom(letter)) end)
  end

  defp single_letter_score(letter) when is_atom(letter) do
    if letter in Map.keys(@scores) do
      @scores[letter]
    else
      0
    end
  end
  
end
