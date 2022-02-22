defmodule KakeiboWeb.PageController do
  use KakeiboWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
