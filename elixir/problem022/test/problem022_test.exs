import Problem022

defmodule Problem022Test do
  use ExUnit.Case
  doctest Problem022

  # base_score tests

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

end
