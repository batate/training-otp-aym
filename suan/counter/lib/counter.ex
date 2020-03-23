defmodule Counter do
  alias Counter.GenericServer

  def start(name, state \\ 42) do
    GenericServer.start_link(name, state)
  end

  defdelegate inc(name), to: GenericServer
  defdelegate state(name), to: GenericServer
end
