defmodule Imgurex.Image do
  @moduledoc """
  Functions to upload and manipulate images on Imgur.
  """

  @enforce_keys [:id, :link]

  defstruct [:id,
             :title,
             :description,
             :datetime,
             :type,
             :animated,
             :width,
             :height,
             :section,
             :nsfw,
             :link]

  @type t :: %__MODULE__{id: String.t,
                         title: String.t,
                         description: String.t,
                         datetime: non_neg_integer,
                         type: String.t,
                         animated: boolean,
                         width: non_neg_integer,
                         height: non_neg_integer,
                         section: String.t,
                         nsfw: boolean,
                         link: String.t}

  @client_id Application.get_env(:imgurex, :client_id)

  @spec info(String.t) :: %__MODULE__{}
  def info(image_id) do
    "/image/#{image_id}"
    |> Imgur.get!(["Authorization": "Client-ID #{@client_id}"])
    |> process_response
  end

  @spec upload(String.t) :: %__MODULE__{}
  def upload(path) do
    "/upload"
    |> Imgur.post!(prepare_image(path), ["Authorization": "Client-ID #{@client_id}"])
    |> process_response
  end

  defp process_response(response) do
    response
    |> Map.get(:body)
    |> Poison.decode!
    |> process_decoded_body
  end

  defp process_decoded_body(%{"success" => true, "data" => data}), do: {:ok, build_image_struct(data)}
  defp process_decoded_body(%{"success" => false, "data" => data}), do: {:error, Map.get(data, "error")}

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
