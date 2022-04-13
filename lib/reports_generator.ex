defmodule ReportsGenerator do
  def build(filename) do
    case File.read("reports/#{filename}") do
      {:ok, file} -> file
      {:error, reason} -> reason
    end
  end
end
