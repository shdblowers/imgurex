defmodule Imgurex.Image do

  @base_url Application.fetch_env!(:imgurex, :base_url)

  def info!(id, client_id) do
    "#{@base_url}/image/#{id}"
    |> HTTPoison.get!(["Authorization": "Client-ID #{client_id}"])
    |> Map.get(:body)
    |> Poison.decode!
    |> Map.get("data")
  end
end
