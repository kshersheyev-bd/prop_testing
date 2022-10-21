defmodule PropTestingTest do
  use ExUnit.Case
  doctest PropTesting

  test "greets the world" do
    assert PropTesting.hello() == :world
  end
end
