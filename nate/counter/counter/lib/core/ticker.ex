defmodule Counter.Ticker do
  def inc(accumulator, step \\ 1) do
    accumulator + step
  end
end