defmodule Counter do
  alias Counter.GenericServer

  def start(state \\ 42) do
    GenericServer.start(state)
  end

  def inc do
    GenericServer.inc()
  end

  def state do
    GenericServer.state()
  end
end
