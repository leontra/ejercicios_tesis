defmodule ServidorCalculadora.Server do
  use GenServer

  ### Public API
  def start_link(id) do
    GenServer.start_link(__MODULE__, [], name: {:global, id})
    |> revisar_inicio()
  end

  defp revisar_inicio({:ok, pid}) do
    {:ok, pid}
  end

  defp revisar_inicio({:error, {_, pid}}) do
    {:ok, pid}
  end

  def resultado(pid) do
    GenServer.call(pid, :resultado)
  end

  def sumar(pid, num) do
    GenServer.cast(pid, {:sumar, num})
  end

  def restar(pid, num) do
    GenServer.cast(pid, {:restar, num})
  end

  def multiplicar(pid, num) do
    GenServer.cast(pid, {:multiplicar, num})
  end

  def dividir(pid, num) do
    GenServer.cast(pid, {:dividir, num})
  end

  ### Private API
  def init(_) do
    {:ok, 0}
  end

  def handle_call(:resultado, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:sumar, num}, state) do
    {:noreply, state + num}
  end

  def handle_cast({:restar, num}, state) do
    {:noreply, state - num}
  end

  def handle_cast({:multiplicar, num}, state) do
    {:noreply, state * num}
  end

  def handle_cast({:dividir, num}, state) do
    {:noreply, state / num}
  end

end
