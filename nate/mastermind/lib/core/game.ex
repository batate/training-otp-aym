defmodule Mastermind.Game do
  alias Mastermind.Score

  defstruct [:answer, guesses: []]

  def new(answer \\ random_answer()) do
    __struct__(answer: answer)
  end

  def state(game) do
    %{rows: rows(game), won: won?(game), lost: lost?(game)}
  end

  def guess(game, guess) do
    %{game | guesses: [guess | game.guesses]}
  end

  def lost?(game) do
    length(game.guesses) == 10 and !won?(game)
  end

  def won?(%{guesses: [answer | _], answer: answer}), do: true
  def won?(%{} = _game), do: false

  defp rows(game) do
    game.guesses
    |> Enum.reverse()
    |> Enum.map(fn guess -> row(guess, game.answer) end)
  end

  defp row(guess, answer) do
    %{guess: guess, score: Map.from_struct(Score.new(guess, answer))}
  end

  defp random_answer() do
    1..8
    |> Enum.shuffle()
    |> Enum.take(4)
  end
end
