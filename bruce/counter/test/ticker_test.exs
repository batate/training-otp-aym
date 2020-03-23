defmodule TickerTest do
  use ExUnit.Case
  alias Counter.Ticker

  test "counts" do
    assert Ticker.inc(1) == 2
  end
end
