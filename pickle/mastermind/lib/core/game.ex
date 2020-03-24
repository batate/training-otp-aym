defmodule Mastermind.Game do
  defstruct guesses: [], answer: [1, 2, 3, 4]

  def new(answer \\ random_answer()) do
    __struct__(answer)
  end

  def guess(game, guess) do
    %{game | guesses: [guess | game.guesses]}
  end

  defp random_answer do
    1..8
    |> Enun.shuffle()
    |> Enum.take(4)
  end
end
