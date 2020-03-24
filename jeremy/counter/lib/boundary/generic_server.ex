defmodule Counter.GenericServer do
  use GenServer

  def start_link(name, default \\ 0) do
    GenServer.start_link(__MODULE__, default, name: name)
  end

  def inc(name) do
    GenServer.cast(name, :inc)
  end

  def state(name) do
    GenServer.call(name, :state)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_cast(:inc, count) do
    {:noreply, Counter.Ticker.inc(count)}
  end

  @impl true
  def handle_call(:state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_info(_message, state) do
    {:noreply, state}
  end
end
