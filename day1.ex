defmodule Day1 do
@moduledoc """
  URL: http://adventofcode.com/2017/day/1

  Part 1:
  The captcha requires you to review a sequence of digits (your puzzle input)
  and find the sum of all digits that match the next digit in the list.
  The list is circular, so the digit after the last digit is the first digit
  in the list.

  Part 2:
  Now, instead of considering the next digit, it wants you to consider the
  digit halfway around the circular list. That is, if your list contains
  10 items, only include a digit in your sum if the digit 10/2 = 5 steps
  forward matches it. Fortunately, your list has an even number of elements.

  ## Example

    iex> Day1.get_answer(1122, :part_one)
    3
    iex> Day1.get_answer(1234, :part_one)
    0
    iex> Day1.get_answer(91212129, :part_one)
    9
    iex> Day1.get_answer(1212, :part_two)
    6
    iex> Day1.get_answer(1221, :part_two)
    0
    iex> Day1.get_answer(123425, :part_two)
    4
    iex> Day1.get_answer(123123, :part_two)
    12
    iex> Day1.get_answer(12131415, :part_two)
    4
  """

  def get_answer(puzzle_input, part) do
    digits = Integer.digits(puzzle_input)
    len = length(digits)
    step = case part do
      :part_one -> 1
      :part_two -> div(len, 2)
      _ -> 1
    end
    digits
    |> Stream.cycle
    |> Enum.take(len + step)
    |> _sum([], step)
  end

  defp _sum([], acc, _step) do
    acc |> Enum.sum
  end

  defp _sum([head | tail] = list, acc, step) do
    acc = if Enum.at(list, step) == head, do: [head | acc], else: acc
    _sum(tail, acc, step)
  end
end
