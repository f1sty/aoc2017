defmodule Day2 do
@moduledoc """
  URL: http://adventofcode.com/2017/day/2

  The spreadsheet consists of rows of apparently-random numbers. To make sure
  the recovery process is on the right track, they need you to calculate the
  spreadsheet's checksum. For each row, determine the difference between the
  largest value and the smallest value; the checksum is the sum of all of
  these differences.

  ## Example

    iex> Day2.get_answer("inputs/day2_test")
    18
  """

  def get_answer(puzzle_input_filename) do
    puzzle_input_filename
    |> File.stream!([:read], :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split/1)
    |> Stream.map(fn line -> Enum.map(line, &String.to_integer/1) end)
    |> Stream.map(&Enum.min_max/1)
    |> Stream.map(fn {in_min, in_max} -> in_max - in_min end)
    |> Enum.sum
  end
end
