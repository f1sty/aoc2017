defmodule Day1 do
@moduledoc """
  URL: http://adventofcode.com/2017/day/1

  The captcha requires you to review a sequence of digits (your puzzle input)
  and find the sum of all digits that match the next digit in the list.
  The list is circular, so the digit after the last digit is the first digit
  in the list.

  ## Example

  iex> Day1.get_answer(1122)
  3
  iex> Day1.get_answer(1234)
  0
  iex> Day1.get_answer(91212129)
  9
  """

  def get_answer(puzzle_input) do
    digits = Integer.digits puzzle_input
    digits = digits ++ [hd(digits)]
    digits
      |> Kernel.--(Enum.dedup(digits))
      |> Enum.sum()
  end
end
