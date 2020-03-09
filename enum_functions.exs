defmodule MyList do

  def all?(list, func), do: all(list, func)
  def all([], _func), do: true
  def all([head | tail], func) do
    if func.(head) do
      all(tail, func)
    else
      false
    end
  end
  
  def each(list, func), do: each(list, [], func)
  def each([], new_list, _func), do: new_list
  def each([head | tail], new_list, func) do
    each(tail, new_list ++ [func.(head)], func)
  end

  def filter(list, func), do: filter(list, [], func)
  def filter([], new_list, _func), do: new_list
  def filter([head | tail], new_list, func) do
    if func.(head) do
      filter(tail, new_list ++ [head], func)
    else
      filter(tail, new_list, func)
    end
  end

  def take(list, index), do: take(list, [], index)
  def take([], new_list, _index), do: new_list
  def take([head | tail], new_list, index) 
    when length(new_list) <= index - 1 do
      take(tail, new_list ++ [head], index)
  end
  def take(_list, new_list, index)
    when length(new_list) > index - 1, do: new_list

  def split(list, index) do
    new_list = take(list, index)
    filter_func = fn n -> !(n in new_list) end
    new_list_two = filter(list, filter_func)
    {new_list, new_list_two}
  end

  def flatten(list), do: flatten(list, [])
  def flatten([], flat_list), do: flat_list
  def flatten([head | tail], flat_list) do
    flatten(tail, flat_list ++ flatten(head))
  end
  def flatten(item, _flat_list), do: [item]

 end
