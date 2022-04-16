defmodule ReportsGenerator.Parser do
  def parse_file(filename) do
    file_path = "reports/#{filename}"

    file_path
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line, 2) end)
  end

  defp parse_line(line, position) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(position, &String.to_integer/1)
  end
end
