defmodule Imgurex.Image do

  defstruct [:id,
	     :title,
	     :description,
	     :datetime,
	     :type,
	     :animated,
	     :width,
	     :height,
	     :nsfw,
	     :link]

  @base_url Application.fetch_env!(:imgurex, :base_url)

  def info!(id, client_id) do
    "#{@base_url}/image/#{id}"
    |> HTTPoison.get!(["Authorization": "Client-ID #{client_id}"])
    |> Map.get(:body)
    |> Poison.decode!
    |> Map.get("data")
    |> build_image_struct
  end

  defp build_image_struct(data) do
    %__MODULE__{id: data["id"],
                title: data["title"],
                description: data["description"],
		datetime: data["datetime"],
		type: data["type"],
		animated: data["animated"],
		width: data["width"],
		height: data["height"],
		nsfw: data["nsfw"],
		link: data["link"]}
  end
end
