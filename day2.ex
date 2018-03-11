defmodule Day2 do
@moduledoc """
  URL: http://adventofcode.com/2017/day/2

  Part 1:
  The spreadsheet consists of rows of apparently-random numbers. To make sure
  the recovery process is on the right track, they need you to calculate the
  spreadsheet's checksum. For each row, determine the difference between the
  largest value and the smallest value; the checksum is the sum of all of
  these differences.

  Part 2:
  It sounds like the goal is to find the only two numbers in each row where
  one evenly divides the other - that is, where the result of the division
  operation is a whole number. They would like you to find those numbers on
  each line, divide them, and add up each line's result.

  ## Examples

    iex> Day2.get_answer("inputs/day2_part_one_test", :part_one)
    18
    iex> Day2.get_answer("inputs/day2_part_two_test", :part_two)
    9
  """

  def get_answer(puzzle_input_filename, part) do
    func = case part do
      :part_one -> &_part_one_func/1
      :part_two -> &_part_two_func/1
      _ -> &_part_one_func/1
    end

    puzzle_input_filename
    |> parse_file
    |> func.()
    |> Enum.sum
  end

  defp parse_file(puzzle_input_filename) do
    puzzle_input_filename
    |> File.stream!([:read], :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split/1)
    |> Stream.map(fn line -> Enum.map(line, &String.to_integer/1) end)
  end

  defp _part_one_func(puzzle_input) do
    puzzle_input
    |> Stream.map(&Enum.min_max/1)
    |> Stream.map(fn {in_min, in_max} -> in_max - in_min end)
  end

  defp _part_two_func(puzzle_input) do
    puzzle_input
    |> Stream.map(&_evenly_divisible(&1, []))
    |> Stream.map(fn {denominator, numerator} ->
      div(numerator, denominator) end)
  end

  defp _evenly_divisible(_list, acc) when length(acc) == 2 do
    acc
    |> Enum.min_max
  end

  defp _evenly_divisible([head | tail], _acc) do
    acc = case Enum.filter(
      tail, &(div(abs(head * &1),Integer.gcd(head, &1)) in head..&1)
    ) do
      [] -> []
      digit when is_list(digit) -> [head | digit]
      _ -> []
    end
    _evenly_divisible(tail, acc)
  end
end
