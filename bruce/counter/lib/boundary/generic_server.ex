defmodule Counter.GenericServer do
  use GenServer
  def start_link(initial_value) do
    GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
  end
  
  # Callbacks
  @impl true
  def init(count) do
    {:ok, count}
  end
 
  @impl true
  def handle_call(:state, _from, count) do 
    {:reply, count, count}
  end
 
  @impl true
  def handle_cast(:inc, count) do
    {:noreply, Counter.Ticker.inc(count)}
  end
end