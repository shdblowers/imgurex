defmodule Imgurex.Album do
  @moduledoc """
  Functions to manipulate albums on Imgur.
  """

  alias Imgurex.Imgur

  @spec create(String.t) :: map
  def create(client_id) do
    "/album"
    |> Imgur.post!(<<>>, ["Authorization": "Client-ID #{client_id}"])
    |> Map.get(:body)
    |> Poison.decode!()
    |> Map.get("data")
  end

end
