defmodule Mastermind do
  alias Mastermind.Server

  def start(answer) do
    Server.start_link(answer)
  end

  def move(pid, guess) do
    Server.move(pid, guess)
  end

  def display(pid) do
    Server.display(pid)
  end

end
