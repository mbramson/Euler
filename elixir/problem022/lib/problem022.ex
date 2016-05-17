defmodule Problem022 do

  @scores %{"a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5, "f" => 6, 
            "g" => 7, "h" => 8, "i" => 9, "j" => 10, "k" => 11, "l" => 12, 
            "m" => 13, "n" => 14, "o" => 15, "p" => 16, "q" => 17, "r" => 18, 
            "s" => 19, "t" => 20, "u" => 21, "v" => 22, "w" => 23, "x" => 24, 
            "y" => 25, "z" => 26}
  @letters ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

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
    |> Stream.map(&score_line/1)
    |> Enum.reduce(%{}, &Map.merge/2)
    |> score_order
  end

  @doc """
  accepts a map of scores for various words and recalculates scores based on
  the key's position alphabeticaly. The lowest word alphabetically has its
  score multiplied by 1, while the 5th highest word has its score multiplied
  by 5, for example.

  Expects a list with no duplicate keys.
  """
  def score_order(score_map) do
    score_map
    |> Enum.map(fn {k, v} -> {k, v} end)
    |> Enum.sort
    |> add_score_map
    |> Enum.map(fn {k, v, o} -> {k, v * o} end )
    |> Enum.into(%{})
  end

  @doc """
  accepts a list of sorted 2-tuples where the first value is the key from the
  original score map, and the second value is the score associated with the
  word.

  Adds a value to each tuple which is the order of the word in the passed in
  list.

  Example: 
  add_score_map[{"aa", 2}, {"cc", 6}] == [{"aa", 2, 1}, {"cc", 6, 2}
  """
  def add_score_map(sorted_score_map) when is_list(sorted_score_map) do
    sorted_score_map
    |> Enum.map(fn {k, _v} -> k end)
    |> produce_order_map
    |> Enum.zip(sorted_score_map)
    |> Enum.map(fn {{k, o}, {k, v}} -> {k, v, o} end )
  end

  @doc """
  Accepts a list of words, and produces a map where the key is the given word
  and the value is the index of the word in the original list. Does not alter
  the order of the list.

  Example: produce_order_map(["b", "a"]) == %{"b" => 1, "a" => 2}

  TODO: Tail Optimize
  """
  def produce_order_map(list) when is_list(list), do: produce_order_map(list, 1)
  defp produce_order_map([], _), do: []
  defp produce_order_map([word|words_left], index) do
    [{word, index}] ++  produce_order_map(words_left, index+1)
  end

  @doc """
  Returns a map where keys are the words in a line delimited by whitespace and
  and punctuation. The values are the name scores of each word before any 
  modification for word alphabetical order is applied.

  Determines the name score for each word by invokingthe score_word function.

  Example:
  score_line("the cat, the dog") returns
  %{"the" => 33, "cat" => 24, "dog" => 26}
  """
  def score_line(""), do: %{}
  def score_line(line) do
    line
    |> String.split([" ", ",", "\"", "'", ".", "!", "?"])
    |> Enum.uniq
    |> Enum.filter(fn word -> word != "" end)
    |> Enum.map(fn word -> {word, score_word(word)} end)
    |> Enum.into(%{})
  end

  @doc """
  Returns the sum of the corresponding alphabet position for each letter in
  the word parameter.

  Example:
  score_word("cat") is 24 (3 + 1 + 20)
  """
  def score_word(word) do
    word
    |> String.downcase
    |> String.codepoints
    |> Enum.reduce(0, fn letter, acc -> 
          acc + single_letter_score(letter) end)
  end
  
  defp single_letter_score(letter) when letter in @letters, do: @scores[letter]
  defp single_letter_score(_letter), do: 0
  
end
