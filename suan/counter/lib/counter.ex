defmodule Counter do
  alias Counter.Server

  def start(state \\ 42) do
    Server.start(state)
  end

  def inc(counter) do
    Server.increment(counter)
  end

  def state(counter) do
    Server.state(counter)
  end
end
