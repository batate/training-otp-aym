defmodule Mastermind.GameTest do
  use ExUnit.Case
  alias Mastermind.Game

  test "creates a Game with specified answer" do
    actual = Game.new([4, 3, 2, 1])
    assert actual.answer == [4, 3, 2, 1]
  end

  test "creates a Game with default answer" do
    actual = Game.new()
    assert length(actual.answer) == 4
  end
end
