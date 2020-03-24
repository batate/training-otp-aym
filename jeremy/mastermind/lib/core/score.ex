defmodule Mastermind.Score do
  # array of atom words
  defstruct ~w[reds whites]a

  def new(guess, answer) do
    __struct__(
      reds: reds(guess, answer),
      whites: whites(guess, answer)
    )
  end

  defp reds(guess, answer) do
    guess
    |> Enum.zip(answer)
    #    |> IO.inspect(label: "zip")
    |> Enum.filter(fn {a, b} -> a == b end)
    |> length
  end

  defp misses(guess, answer) do
    (guess -- answer)
    |> length
  end

  defp whites(guess, answer) do
    width(answer) - reds(guess, answer) - misses(guess, answer)
  end

  defp width(answer) do
    length(answer)
  end
end
