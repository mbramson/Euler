import Problem022

defmodule Problem022Test do
  use ExUnit.Case
  doctest Problem022

  # score_line tests
  
  test "empty line is an empty map" do
    assert score_line("") == %{}
  end

  test "single letter a generates map with correct structure" do
    assert score_line("a") == %{"a" => 1}
  end

  test "two words generate the correct map" do
    assert score_line("the cat") == %{"the" => 33, "cat" => 24}
  end

  test "two words deliminated by more than one space is correct" do
    assert score_line("a   t") == %{"a" => 1, "t" => 20}
  end

  test "same word twice yields single key map" do
    assert score_line("elixir elixir") == %{"elixir" => 77}
  end

  test "three words generate the correct map" do
    assert score_line("one two three") == %{"one" => 34, "two" => 58, "three" => 56}
  end

  test "punctuation not included by score_line" do
    assert score_line(~s("one", 'two'. "three"!?)) == 
      %{"one" => 34, "two" => 58, "three" => 56}
  end

  # score_word tests

  test "empty string scores 0" do
    assert score_word("") == 0
  end

  test "a scores 1" do
    assert score_word("a") == 1
  end

  test "aa scores 2" do
    assert score_word("aa") == 2
  end

  test "abc scores 6" do
    assert score_word("abc") == 6
  end

  test "cat scores 24" do
    assert score_word("cat") == 24
  end

  test "A scores 1" do
    assert score_word("A") == 1
  end

end
