defmodule Exercises do
  def sums(0), do: 0
  def sums(n), do: n + sums(n - 1)


  def gcd(x,0), do: x 
  def gcd(x,y), do: gcd(y, rem(x,y))
end
