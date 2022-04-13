defmodule ReportsGenerator do
  def build(filename) do
    file_path = "reports/#{filename}"

    file_path
    |> File.stream!()
    |> Enum.map(fn line -> parse_line(line, 2) end)

    # |> Enum.map(&parse_line(&1, 2))
  end

  defp parse_line(line, position) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(position, &String.to_integer/1)

    # |> List.update_at(position, fn elem -> String.to_integer(elem) end)
  end
end
