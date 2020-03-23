defmodule Counter.Server do
  def start(initial) do
    spawn fn -> run(initial) end
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