defmodule Helpers do
@moduledoc """
  Helper functions for common tasks in AoC solutions.
  """

  def read_and_split(input_filename) do
    input_filename
    |> File.stream!([:read], :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split/1)
  end
end
