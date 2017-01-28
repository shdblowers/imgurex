defmodule Imgurex.Album do
@moduledoc"""
Functions to manipulate albums on Imgur.
"""

  @base_url Application.fetch_env!(:imgurex, :base_url)

  @spec create(String.t) :: map
  def create(client_id) do
    "#{@base_url}/album"
    |> HTTPoison.post!(<<>>, ["Authorization": "Client-ID #{client_id}"])
    |> Map.get(:body)
    |> Poison.decode!()
  end

end
