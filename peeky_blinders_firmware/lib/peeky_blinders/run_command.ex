defmodule PeekyBlinders.RunCommand do
  def call(name) do
    path = Path.join(:code.priv_dir(:peeky_blinders), "#{name}.iq")
    Replex.replay(path, 433889000, sample_rate: 250_000)
    PeekyBlindersUi.DisplayCommand.call(name)
  end
end
