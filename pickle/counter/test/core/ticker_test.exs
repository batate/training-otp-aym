defmodule Counter.TickerTest do
  use ExUnit.Case
  alias Counter.Ticker

  test "increments a value" do
    v = 42
    assert Ticker.inc(v) == v + 1
  end
end
