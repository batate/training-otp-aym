defmodule Counter.Server do
  def start(initial) do
    spawn fn -> run(initial) end
  end
  
  def inc(counter) do
    send counter, :inc
  end
  
  def state(counter) do
    send counter, {:state, self()}
    receive do
      count -> count
    after
      5000 ->
        :error
    end
  end
  
  def run(count) do
    count
    |> listen
    |> run
  end
  
  def listen(count) do
    receive do
      :inc -> 
        count + 1
      {:state, pid} -> 
        send pid, count
        count
    end
  end
end