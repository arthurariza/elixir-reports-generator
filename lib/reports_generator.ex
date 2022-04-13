defmodule ReportsGenerator do
  def build(filename) do
    file_path = "reports/#{filename}"

    file_path
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, file}), do: file
  defp handle_file({:error, reason}), do: reason
end
