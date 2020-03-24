defmodule Mastermind.Server do
  use GenServer
  alias Mastermind.Game

  def start_link(answer) do
    GenServer.start_link(__MODULE__, answer, name: __MODULE__)
  end

  def move(pid, guess) do
    GenServer.call(pid, {:move, guess})
  end

  def display(pid) do
    send(pid, :print)
  end

  def init(nil) do
    {:ok, Game.new()}
  end

  def init(answer) do
    {:ok, Game.new(answer)}
  end

  def handle_call({:move, guess}, _from, game) do
    new_game = Game.guess(game, guess)
    send(self(), :print)

    {:reply, :ok, new_game}
  end

  def handle_info(:print, game) do
    state = Game.state(game)
    print(state)

    {:noreply, game}
  end

  defp print(game_state) do
    IO.puts("Won: #{game_state.won} Lost: #{game_state.lost}")

    Enum.each(game_state.rows, fn row ->
      IO.puts(
        "#{inspect(row.guess)} #{String.duplicate("R", row.score.reds)} #{
          String.duplicate("W", row.score.whites)
        }"
      )
    end)
  end
end
