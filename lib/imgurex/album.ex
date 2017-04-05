defmodule Imgurex.Album do
  @moduledoc """
  Functions to manipulate albums on Imgur.
  """

  alias Imgurex.Imgur

  @enforce_keys [:id]

  defstruct [:id, :deletehash]

  @type t :: %__MODULE__{id: String.t, deletehash: String.t}

  @spec create(String.t) :: map
  def create(client_id) do
    "/album"
    |> Imgur.post!(<<>>, ["Authorization": "Client-ID #{client_id}"])
    |> Map.get(:body)
    |> Poison.decode!
    |> Map.get("data")
    |> build_album_struct
  end

  defp build_album_struct(data) do
    %__MODULE__{id: data["id"], deletehash: data["deletehash"]}
  end

end
