defmodule PropTesting.List do
  @doc """
  Removes all occurences of element in list
  """
  @spec delete(list(), any()) :: list()
  def delete(list, elem) do
    # list -- [elem]
    for x <- list, x != elem do
      x
    end
  end

  @doc """
  Unwraps deep lists
  """
  @spec flatten(list()) :: list()
  def flatten(list) do
    Enum.reduce(list, [], fn elem, acc ->
      if is_list(elem) do
        # acc ++ elem
        acc ++ flatten(elem)
      else
        acc ++ [elem]
      end
    end)
  end
end
