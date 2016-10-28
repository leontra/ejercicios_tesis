defmodule UsuarioCalculadora.CalculadoraUsuarioTest do
  use ExUnit.Case
  alias UsuarioCalculadora.Usuario

  test "iniciar conexion de un usuario" do
    assert {:ok, :nuevo, _msg} = Usuario.iniciar_conexion()
  end

  test "iniciar conexion de dos usuarios" do
    assert {:ok, :nuevo, _msg} = Usuario.iniciar_conexion()
    assert {:ok, :abierto, _msg} = Usuario.iniciar_conexion()
  end

  test "iniciar conexion de tres usuarios" do
    assert {:ok, :nuevo, _msg} = Usuario.iniciar_conexion()
    assert {:ok, :abierto, _msg} = Usuario.iniciar_conexion()
    assert {:ok, :abierto, _msg} = Usuario.iniciar_conexion()
  end

  test "hacer operaciones con un usuario" do
    assert {:ok, :nuevo, _msg} = Usuario.iniciar_conexion()
    :ok = Usuario.hacer_operacion(:sumar, 10)
    :ok = Usuario.hacer_operacion(:restar, 1)
    assert 9 = Usuario.resultado()
  end

  test "hacer operaciones con dos usuarios conectados hacia el mismo servidor" do
    usuario_uno = Usuario.iniciar_conexion()
    assert {:ok, :nuevo, _msg} = usuario_uno

    usuario_dos = Usuario.iniciar_conexion()
    assert {:ok, :abierto, _} = usuario_dos
  end

end
