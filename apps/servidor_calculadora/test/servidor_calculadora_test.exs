defmodule ServidorCalculadoraTest do
  use ExUnit.Case
  doctest ServidorCalculadora
  import TestHelper

  test "starting un nuevo servidor calculadora" do
    assert {:ok, _pid} = ServidorCalculadora.start_calculadora(new_id())
  end

end
