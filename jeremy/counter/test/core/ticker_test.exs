defmodule TickerTest do
  use ExUnit.Case
  alias Counter.Ticker

  test "increments a value" do
    assert Ticker.inc(1) == 2
    assert Ticker.inc(5, 5) == 10
    assert Ticker.inc(3, -1) == 2
  end
end
