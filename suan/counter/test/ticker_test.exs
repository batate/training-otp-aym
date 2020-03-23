defmodule TickerTest do
  use ExUnit.case
  alias Counter.Ticker

  test "increments a value" do
    assert Ticker.inc(1) == 2
    assert Ticker.inc(5) == 6
  end
end