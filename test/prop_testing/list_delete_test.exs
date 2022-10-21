defmodule PropTesting.ListDeleteTest do
  use ExUnit.Case, async: true
  use ExUnitProperties
  import StreamData

  describe "delete/2" do
    property "remove element from list" do
      check all list <- list_of(integer(2..5), max_length: 20),
                integer <- integer(2..5) do
        list = PropTesting.List.delete(list, integer)
        refute Enum.member?(list, integer)
      end
    end
  end
end
