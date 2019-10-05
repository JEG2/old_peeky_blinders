defmodule PeekyBlindersUi.DisplayCommand do
  def call(name) do
    name
    |> split
    |> identify
    |> report
  end

  defp split(name), do: String.split(name, "_")

  defp identify([number, direction]) do
    {identify_window(number), identify_motion(direction)}
  end

  defp identify_window("0"), do: "All windows"
  defp identify_window("1"), do: "The left window"
  defp identify_window("2"), do: "The middle window"
  defp identify_window("3"), do: "The right window"

  defp identify_motion("up"), do: "going up"
  defp identify_motion("stop"), do: "stopping"
  defp identify_motion("down"), do: "going down"

  defp report({window, motion}), do: "#{window} should be #{motion}."
end
