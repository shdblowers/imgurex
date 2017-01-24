defmodule Imgurex.ImageTest do
  use ExUnit.Case, async: false

  alias Imgurex.Image

  setup_all do
    :meck.new(HTTPoison)
    on_exit fn -> :meck.unload end
    :ok
  end

  test "getting info for a ticket" do
    expected = %Image{id: "Pc123G7",
		      title: "Example Image",
		      description: "picture of a test",
		      datetime: 1480768844,
		      type: "image/jpeg",
		      animated: false,
		      width: 1080,
		      height: 1920,
		      nsfw: nil,
		      link: "http://i.imgur.com/Pc123G7.jpg"}

    stub = fn("https://api.imgur.com/3/image/Pc123G7",
              ["Authorization": "Client-ID 12149508e8b758f"]) ->
	%HTTPoison.Response{body: Poison.encode!(%{success: true, data: expected})}
    end
    :meck.expect(HTTPoison, :get!, stub)

    actual = Image.info("Pc123G7", "12149508e8b758f")

    assert {:ok, expected} == actual
  end

  test "unsuccessful get of ticket info" do
    expected = "Unable to find image with the id, 1234567890"

    stub = fn("https://api.imgur.com/3/image/1234567890",
              ["Authorization": "Client-ID 12149508e8b758f"]) ->
      %HTTPoison.Response{body: Poison.encode!(%{success: false, data: %{error: expected}})}
    end
    :meck.expect(HTTPoison, :get!, stub)

    actual = Image.info("1234567890", "12149508e8b758f")

    assert {:error, expected} == actual
  end

  test "uploading an image" do
    expected = %Image{id: "uHi876l", link: "http://i.imgur.com/uHi876l.jpg"}

    stub =
      fn("https://api.imgur.com/3/upload",
         _,
         ["Authorization": "Client-ID 12149508e8b758f"]) ->
	%HTTPoison.Response{body: Poison.encode!(%{success: true, data: expected})}
      end
    :meck.expect(HTTPoison, :post!, stub)

    actual = Image.upload("test/imgurex/test_image.jpeg", "12149508e8b758f")

    assert {:ok, expected} == actual
  end
end
