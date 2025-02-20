defmodule ExampleElixirTest do
  use ExUnit.Case
  doctest ExampleElixir

  test "greets the world" do
    assert ExampleElixir.hello() == :world
  end
end
