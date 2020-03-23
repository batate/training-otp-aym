defmodule Counter.Server do
  alias Counter.Ticker

  def increment(counter) do
    send(counter, :increment)
  end

  def state(counter) do
    send(counter, {:state, self()})

    receive do
      count -> count
    after
      2000 ->
        IO.puts(:stderr, "No msg in 2 secs")
    end
  end

  def start(initial) do
    spawn(fn -> run(initial) end)
  end

  @spec run(any) :: no_return
  def run(count) do
    count
    |> listen
    |> run
  end

  def listen(count) do
    receive do
      :increment ->
        Ticker.increment(count)

      {:state, pid} ->
        send(pid, count)
        count
    end
  end
end
