defmodule Mastermind.ScoreTest do
  use ExUnit.Case
  alias Mastermind.Score

  test "all reds" do
    score = Score.new([1,2,3,4], [1,2,3,4])
    assert score.reds == 4
    assert score.whites == 0
  end

  test "all whites" do
    score = Score.new([1,2,3,4], [4,3,2,1])
    assert score.reds == 0
    assert score.whites == 4
  end

  test "all misses" do
    score = Score.new([1,2,3,4], [6,7,8,9])
    assert score.reds == 0
    assert score.whites == 0
  end

  test "some whites some reds" do
    score = Score.new([1,2,3,4], [1,2,4,3])
    assert score.reds == 2
    assert score.whites == 2
  end

  test "everything" do
    score = Score.new([1,2,3,4], [1,2,4,5])
    assert score.reds == 2
    assert score.whites == 1
  end

end