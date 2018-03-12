defmodule Day4 do
@moduledoc """
  URL: http://adventofcode.com/2017/day/4

  Part 1:
  A new system policy has been put in place that requires all accounts to use
  a passphrase instead of simply a password. A passphrase consists of a series
  of words (lowercase letters) separated by spaces.
  To ensure security, a valid passphrase must contain no duplicate words.
  The system's full passphrase list is available as your puzzle input.
  How many passphrases are valid?

  Part 2:
  For added security, yet another system policy has been put in place. Now,
  a valid passphrase must contain no two words that are anagrams of each
  other - that is, a passphrase is invalid if any word's letters can be
  rearranged to form any other word in the passphrase.

  ## Examples

    iex> Day4.get_answer("inputs/day4_test", :part_one)
    455
    iex> Day4.get_answer("inputs/day4_test")
    455
    iex> Day4.get_answer("inputs/day4_test", :part_two)
    186
  """

  def get_answer(puzzle_input_filename, part \\ :part_one) do
    part_func = case part do
      :part_one -> &_part_one_func/1
      :part_two -> &_part_two_func/1
      _ -> &_part_one_func/1
    end

    puzzle_input_filename
    |> Helpers.read_and_split
    |> part_func.()
    |> Stream.filter(&(&1 == Enum.uniq(&1)))
    |> Enum.count
  end

  defp _part_one_func(puzzle_input) do
    puzzle_input
  end

  defp _part_two_func(puzzle_input) do
    puzzle_input
    |> Stream.map(&_transform/1)
  end

  defp _transform(puzzle_row) do
    puzzle_row
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&Enum.sort/1)
    |> Enum.map(&Enum.join/1)
  end
end
