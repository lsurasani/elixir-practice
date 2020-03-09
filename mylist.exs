defmodule MyList do
  
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]), do: [head*head | square(tail) ]

  def add_1([]), do: []
  def add_1([ head | tail]), do: [head + 1 | add_1(tail)]
  
  def map([], _func), do: []
  def map([head | tail], func), do: [ func.(head) | map(tail, func) ]

  def sum(list), do: _sum(list, 0)

  def caesar(list, n) do
    map(list, &(&1 + n))
  end

  def mapsum(list, func) do
    _mapsum(list, 0, func)
  end

  def max([head | tail]) do
    _max([head | tail], head) 
  end

  def span(start_item, end_item), do: _span([start_item], end_item, start_item)

  defp _span(list, end_item, prev) when prev == end_item, do: list
  defp _span(list, end_item, prev) when prev < end_item do
    _span(list ++ [prev + 1], end_item, prev + 1)
  end
  defp _span(list, end_item, prev) when prev > end_item do
    raise "From number must be less than to number"
  end

  defp _max([], current_max), do: current_max
  defp _max([head | tail], current_max) when head >= current_max, do: _max(tail, head)
  defp _max([head | tail], current_max) when head < current_max, do: _max(tail, current_max)

  defp _mapsum([], total, func), do: total
  defp _mapsum([head | tail], total, func), do: _mapsum(tail, func.(head) + total, func)

  defp _sum([], total), do: total
  defp _sum([head | tail], total), do: _sum(tail, head + total) 

end

