defmodule ServidorCalculadora.SupervisorTest do
  use ExUnit.Case, async: true
  import TestHelper

  test "creating un servidor inexistente" do
    assert {:ok, _pid} = ServidorCalculadora.Supervisor.start_calculadora(new_id())
  end

  test "creating un servidor cuando ya hay otro con el mismo nombre" do
    the_id = new_id()
    assert {:ok, pid} = ServidorCalculadora.Supervisor.start_calculadora(the_id)
    assert {:ok, ^pid} = ServidorCalculadora.Supervisor.start_calculadora(the_id)
  end

end
