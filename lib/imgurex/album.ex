defmodule Imgurex.Album do

  @base_url Application.fetch_env!(:imgurex, :base_url)
  
  def create(client_id) do
    "#{@base_url}/album"
    |> HTTPoison.post!(<<>>, ["Authorization": "Client-ID #{client_id}"])
    |> Map.get(:body)
    |> Poison.decode!()
  end
  
end
