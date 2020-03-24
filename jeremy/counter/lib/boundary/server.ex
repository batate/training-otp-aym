defmodule Counter.Server do

  def increment(counter) do
    send counter, :increment
  end

  def get_state(counter) do
    send counter, {:state, self()}
    receive do
      count -> count
    end
  end

  def start(initial) do
    spawn(fn -> run initial end)
  end

  def run(count) do
    count
    |> listen
    |> run
  end

  def listen(count) do
    receive do
      :increment ->
        count + 1
      {:state, pid} ->
        send pid, count
        count
    end
  end
end
