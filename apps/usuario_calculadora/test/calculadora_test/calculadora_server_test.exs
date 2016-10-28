defmodule UsuarioCalculadora.CalculadoraTest do
  use ExUnit.Case
  alias ServidorCalculadora.Server

  test "conexion al servidor" do
    assert {:ok, _pid} = Server.start_link()
  end

  test "estado inicial cero" do
    assert {:ok, _pid} = Server.start_link()
    assert 0 = Server.resultado()
  end

  test "operacion sumar" do
    assert {:ok, _pid} = Server.start_link()
    :ok = Server.sumar(5)
    :ok = Server.sumar(7)
    assert 12 = Server.resultado()
  end

  test "operacion restar" do
    assert {:ok, _pid} = Server.start_link()
    :ok = Server.restar(5)
    assert -5 = Server.resultado()
  end

  test "sumar y restar" do
    assert {:ok, _pid} = Server.start_link()
    :ok = Server.sumar(61)
    assert 61 = Server.resultado()
    :ok = Server.restar(14)
    assert 47 = Server.resultado()
    :ok = Server.restar(7)
    assert 40 = Server.resultado()
  end

  test "operacion multiplicar" do
    assert {:ok, _pid} = Server.start_link()
    :ok = Server.multiplicar(5)
    assert 0 = Server.resultado()
  end

  test "sumar, restar y multiplicar" do
    assert {:ok, _pid} = Server.start_link()
    :ok = Server.sumar(8)
    assert 8 = Server.resultado()
    :ok = Server.restar(4)
    assert 4 = Server.resultado()
    :ok = Server.multiplicar(5)
    assert 20 = Server.resultado()
  end

  test "operacion dividir" do
    assert {:ok, _pid} = Server.start_link()
    :ok = Server.dividir(5)
    assert 0.0 = Server.resultado()
  end

  test "sumar, restar, multiplicar y dividir" do
    assert {:ok, _pid} = Server.start_link()
    :ok = Server.sumar(32)
    assert 32 = Server.resultado()
    :ok = Server.restar(2);
    assert 30 = Server.resultado()
    :ok = Server.multiplicar(4)
    assert 120 = Server.resultado()
    :ok = Server.dividir(2)
    assert 60.0 = Server.resultado()
  end

end
