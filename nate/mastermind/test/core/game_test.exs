defmodule Mastermind.GameTest do
  use ExUnit.Case
  alias Mastermind.Game

  test "creates game with specific answer" do
    answer = [4, 3, 2, 1]
    actual = Game.new(answer)
    state = Game.state(actual)

    assert actual.answer == answer
    assert %{lost: false, won: false, rows: []} == state
  end

  test "creates game with default answer" do
    actual = Game.new()
    state = Game.state(actual)

    assert length(actual.answer) == 4
    assert %{lost: false, won: false, rows: []} == state
  end

  test "player makes a move" do
    guess = [3, 4, 5, 6]
    actual = single_nonwinning_move()
    state = Game.state(actual)

    assert actual.guesses == [guess]
    assert %{lost: false, won: false, rows: [_]} = state
    assert %{guess: guess, score: _} = state.rows |> hd()
  end

  test "correct guess wins" do
    assert Game.won?(winning_game())
    assert Game.won?(ten_move_winner())
    refute Game.won?(empty_game())
    refute Game.won?(single_nonwinning_move())
  end

  test "will lose game" do
    assert Game.lost?(loser_game())
    refute Game.lost?(ten_move_winner())
  end

  defp assert_field(map, field, expected) do
    assert Map.get(map, field) == expected
    map
  end

  defp ten_move_winner() do
    answer = [1, 2, 3, 4]

    Game.new(answer)
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(winner(answer))
  end

  defp loser_game() do
    answer = [1, 2, 3, 4]

    Game.new(answer)
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
    |> Game.guess(loser(answer))
  end

  defp winner(a) when is_list(a), do: a

  defp loser(a) when is_list(a) do
    a
    |> Enum.map(fn x -> x + 4 end)
    |> Enum.reverse()
  end

  defp empty_game() do
    Game.new([1, 2, 3, 4])
  end

  defp single_nonwinning_move() do
    Game.new([1, 2, 3, 4])
    |> Game.guess([3, 4, 5, 6])
  end

  defp winning_game() do
    Game.new([1, 2, 3, 4])
    |> Game.guess([1, 2, 3, 4])
  end
end
