defmodule Imgurex.Image do

  @enforce_keys [:id, :link]
  
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

  def info(id, client_id) do
    "#{@base_url}/image/#{id}"
    |> HTTPoison.get!(["Authorization": "Client-ID #{client_id}"])
    |> process_response
  end

  def upload(path, client_id) do
    "#{@base_url}/upload"
    |> HTTPoison.post!(prepare_image(path), ["Authorization": "Client-ID #{client_id}"])
    |> process_response
  end

  defp process_response(response) do
    decoded_body =
      response
      |> Map.get(:body)
      |> Poison.decode!

    case decoded_body do
      %{"success" => true} ->
	{:ok, build_image_struct(Map.get(decoded_body, "data"))}
      %{"success" => false} ->
	{:error, decoded_body |> Map.get("data") |> Map.get("error")}
    end
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

  defp prepare_image(path) do
    path
    |> File.read!
    |> Base.encode64
    |> Poison.encode!
  end
end
