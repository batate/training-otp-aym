defmodule Counter.Server do
  # def handle_cast(:inc, state)
  def inc(counter) do
    send(counter, :inc)
  end

  # def handle_call(:state, from, state)
  def state(counter) do
    send(counter, {:state, self()})

    receive do
      count -> count
    after
      5000 ->
        IO.puts("NOOOPE")
    end
  end

  def start(state) do
    spawn(fn -> run(state) end)
  end

  def run(count) do
    count
    |> listen()
    |> run()
  end

  def listen(count) do
    receive do
      :inc ->
        count + 1

      {:state, pid} ->
        send(pid, count)
        count
    end
  end
end

"""
DO - Data
FUN - Functions
THINGS - Testing

LOUD - Lifecycle
WORKER - Workers
BEES - Boundaries
"""
