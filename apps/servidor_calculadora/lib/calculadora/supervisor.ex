defmodule ServidorCalculadora.Supervisor do
  use Supervisor
  @name ServidorCalculadoraSupervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: @name)
  end

  def start_calculadora(id) do
    Supervisor.start_child(@name, [id])
  end

  def init(_) do
    children = [
      worker(ServidorCalculadora.Server, [], restart: :transient)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
