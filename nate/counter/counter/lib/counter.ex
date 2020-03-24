defmodule Counter do
  alias Counter.Server
  def start(count \\ 42), do: Server.start(count)
  def inc(counter), do: Server.inc(counter)
  def state(counter), do: Server.state(counter)
end
