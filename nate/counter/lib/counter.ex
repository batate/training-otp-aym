defmodule Counter do
  alias Counter.GenericServer

  def start(name, default \\ 42) do
    GenericServer.start_link(name, default)
  end

  def inc(name) do
    GenericServer.inc(name)
  end

  def state(name) do
    GenericServer.state(name)
  end

end
