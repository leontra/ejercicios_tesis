defmodule ServidorCalculadora.ServerTest do
  use ExUnit.Case
  alias ServidorCalculadora.Server
  import TestHelper

  test "starting the server" do
    assert {:ok, _pid} = Server.start_link(new_id())
  end

  test "estado inicial cero" do
    assert {:ok, pid} = Server.start_link(new_id())
    assert 0 = Server.resultado(pid)
  end

  test "operacion sumar" do
    assert {:ok, pid} = Server.start_link(new_id())
    :ok = Server.sumar(pid, 5)
    :ok = Server.sumar(pid, 7)
    assert 12 = Server.resultado(pid)
  end

  test "operacion restar" do
    assert {:ok, pid} = Server.start_link(new_id())
    :ok = Server.restar(pid, 5)
    assert -5 = Server.resultado(pid)
  end

  test "sumar y restar" do
    assert {:ok, pid} = Server.start_link(new_id())
    :ok = Server.sumar(pid, 61)
    assert 61 = Server.resultado(pid)
    :ok = Server.restar(pid, 14)
    assert 47 = Server.resultado(pid)
    :ok = Server.restar(pid, 7)
    assert 40 = Server.resultado(pid)
  end

  test "operacion multiplicar" do
    assert {:ok, pid} = Server.start_link(new_id())
    :ok = Server.multiplicar(pid, 5)
    assert 0 = Server.resultado(pid)
  end

  test "sumar, restar y multiplicar" do
    assert {:ok, pid} = Server.start_link(new_id())
    :ok = Server.sumar(pid, 8)
    assert 8 = Server.resultado(pid)
    :ok = Server.restar(pid, 4)
    assert 4 = Server.resultado(pid)
    :ok = Server.multiplicar(pid, 5)
    assert 20 = Server.resultado(pid)
  end

  test "operacion dividir" do
    assert {:ok, pid} = Server.start_link(new_id())
    :ok = Server.dividir(pid, 5)
    assert 0.0 = Server.resultado(pid)
  end

  test "sumar, restar, multiplicar y dividir" do
    assert {:ok, pid} = Server.start_link(new_id())
    :ok = Server.sumar(pid, 32)
    assert 32 = Server.resultado(pid)
    :ok = Server.restar(pid, 2)
    assert 30 = Server.resultado(pid)
    :ok = Server.multiplicar(pid, 4)
    assert 120 = Server.resultado(pid)
    :ok = Server.dividir(pid, 2)
    assert 60.0 = Server.resultado(pid)
  end

end
