defmodule UsuarioCalculadora.Usuario do
  alias ServidorCalculadora.Server

  ### Public interface
  def iniciar_conexion do
    Server.start_link()
    |> iniciar()
  end

  def resultado do
    Server.resultado()
  end

  def hacer_operacion(:sumar, num) do
    Server.sumar(num)
  end

  def hacer_operacion(:restar, num) do
    Server.restar(num)
  end

  def hacer_operacion(:multiplicar, num) do
    Server.multiplicar(num)
  end

  def hacer_operacion(:dividir, num) do
    Server.dividir(num)
  end

  ### Private interface
  defp iniciar({:error, _algo}) do
    {:ok, :abierto, "Servidor ya iniciado"}
  end

  defp iniciar({:ok, _pid}) do
    {:ok, :nuevo, "Servidor nuevo"}
  end

end
