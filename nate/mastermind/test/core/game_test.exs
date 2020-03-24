defmodule Mastermind.GameTest do
  use ExUnit.Case
  alias Mastermind.Game

  test "creates game with specific answer" do
    actual = Game.new([4,3,2,1])
    assert actual.answer == [4,3,2,1]
  end

  test "creates game with default answer" do
    actual = Game.new()
    assert length(actual.answer) == 4
  end

  test "player makes a move" do
    assert single_nonwinning_move().guesses == [[3,4,5,6]]
  end

  test "correct guess wins" do
    assert Game.won?(winning_game())
    refute Game.won?(empty_game())
    refute Game.won?(single_nonwinning_move())
  end

  def empty_game() do
    Game.new([1,2,3,4])
  end

  def single_nonwinning_move() do
    Game.new([1,2,3,4])
    |> Game.guess([3,4,5,6])
  end

  def winning_game() do
    Game.new([1,2,3,4])
    |> Game.guess([1,2,3,4])
  end
end
