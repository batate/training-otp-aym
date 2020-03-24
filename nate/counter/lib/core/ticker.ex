defmodule Counter.Ticker do
    def increment(accumulator, step \\ 1) do
        accumulator + step
    end
end