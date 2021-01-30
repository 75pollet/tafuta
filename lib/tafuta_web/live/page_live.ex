defmodule TafutaWeb.PageLive do
  use TafutaWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, words: ["sleep", "try", "commit", "fly"], points: 0, answer: "", board: board())}
  end

  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  def handle_event("submit", %{"word" => ans}, socket) do
    words = socket.assigns.words

    case correct_answer?(ans, words) do
      true ->
        {:noreply,
         socket
         |> put_flash(:info, "You earned 5 points!")
         |> assign(points: socket.assigns.points + 5, words: socket.assigns.words -- [ans])
         |> push_patch(
           to: Routes.page_path(socket, :index)
         )}


      false ->
        {:noreply,
         socket
         |> put_flash(:error, "Please try again!")
         |> push_patch(
           to: Routes.page_path(socket, :index)
         )}
    end
  end

  def correct_answer?(ans, words) do
    words
    |> Enum.any?(fn word ->
      String.equivalent?(word, ans)
     end)
  end

  def board do
    [["o","s","l","e","e","p"],
     ["l","m","t","r","y","o"],
     ["c","o","m","m","i","t"],
     ["l","o","j","h","u","e"],
     ["p","q","f","l","y","s"]]
  end
end
