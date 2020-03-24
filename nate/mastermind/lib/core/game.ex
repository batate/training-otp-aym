defmodule Mastermind.Game do
  defstruct [:answer, guesses: []]

  def new(answer \\ random_answer()) do
    __struct__(answer: answer)
  end

  def guess(game, guess) do
    %{game | guesses: [guess | game.guesses]}
  end

  def won?(%{guesses: [answer | _], answer: answer}), do: true
  def won?(_game), do: false

  defp random_answer() do
    1..8
    |> Enum.shuffle()
    |> Enum.take(4)
  end

end
