defmodule Counter.GenericServer do
  use GenServer

  def start_link(default \\ 0) do
    GenServer.start_link(__MODULE__, default, name: __MODULE__)
  end

  def inc do
    GenServer.cast(__MODULE__, :inc)
  end

  def state do
    GenServer.call(__MODULE__, :state)
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
  def handle_info(message, state) do
    # :noop
    IO.inspect(message, label: "rcvd in handle_info")
    {:noreply, state}
  end
end
