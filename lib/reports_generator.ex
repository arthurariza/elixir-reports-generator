defmodule ReportsGenerator do
  def build(filename) do
    file_path = "reports/#{filename}"

    file_path
    |> File.stream!()
    |> Enum.reduce(report_acc(), fn line, report ->
      [id, _food_name, price] = parse_line(line, 2)
      Map.put(report, id, report[id] + price)
    end)

    # |> Enum.map(&parse_line(&1, 2))
  end

  defp parse_line(line, position) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(position, &String.to_integer/1)

    # |> List.update_at(position, fn elem -> String.to_integer(elem) end)
  end

  defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
end
