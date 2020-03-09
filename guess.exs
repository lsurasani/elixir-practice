defmodule Chop do
  
  def guess(actual, min..max) do
    guess = div((min + max), 2)
    IO.puts "Is it #{guess}"

    next_guess(actual, guess, min..max)
  end

  def next_guess(actual, guess, min..max) when guess === actual do
    IO.puts actual
  end

  def next_guess(actual, guess, min..max) when guess > actual do
    guess(actual, min..guess)
  end

  def next_guess(actual, guess, min..max) when guess < actual do
    guess(actual, guess..max)
  end
end
