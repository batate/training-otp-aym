defmodule TickerTest do
    use ExUnit.Case
    alias Counter.Ticker

    test "increments a value" do
        assert Ticker.increment(1) == 2
        assert Ticker.increment(5, 5) == 10 
        assert Ticker.increment(3, -1) == 2
    end
end