defmodule TafutaWeb.PageLive do
  use TafutaWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, board: board())}
  end

  def board do
    [["o","s","l","e","e","p"],
     ["l","m","t","r","y","o"],
     ["c","o","m","m","i","t"],
     ["l","o","j","h","u","e"],
     ["p","q","f","l","y","s"]]
  end
end
