defmodule PeekyBlindersUiWeb.PageController do
  use PeekyBlindersUiWeb, :controller

  @command_interpreter Application.fetch_env!(
    :peeky_blinders_ui,
    :command_interpreter
  )

  def index(conn, %{"command" => command}) do
    result = @command_interpreter.call(command)
    conn
    |> put_flash(:info, result)
    |> redirect(to: Routes.page_path(conn, :index))
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
