defmodule PropTesting.ListFlattenTest do
  use ExUnit.Case, async: true
  use ExUnitProperties
  import StreamData

  describe "flatten/1" do
    property "remove element from list" do
      check all list <- list_tree(5) do
        list = PropTesting.List.flatten(list)
        refute Enum.any?(list, &is_list(&1))
      end
    end
  end

  def list_tree(0) do
    list_of(integer(), max_length: 3)
  end

  def list_tree(n) do
    list_of(one_of([list_tree(n-1), integer()]), max_length: 3)
  end
end
