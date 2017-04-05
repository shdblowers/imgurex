defmodule Imgurex.ImageTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias Imgurex.Image

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/image")
    HTTPoison.start
  end

  test "getting info for a ticket" do
    expected = %Image{id: "coZb0HC",
                      title: "Horse tries out hoodie zipper",
                      description: nil,
                      datetime: 1491247943,
                      type: "image/gif",
                      animated: true,
                      width: 720,
                      height: 1280,
                      nsfw: false,
                      link: "http://i.imgur.com/coZb0HCh.gif"}

    ExVCR.Config.filter_request_headers("Authorization")
    use_cassette "info" do
      actual = Image.info("coZb0HC")

      assert {:ok, expected} == actual
    end
    ExVCR.Config.filter_request_headers(nil)
  end

  test "unsuccessful get of ticket info" do
    expected = "Unable to find an image with the id, 1234567890"

    ExVCR.Config.filter_request_headers("Authorization")
    use_cassette "unable_to_find" do
      actual = Image.info("1234567890")

      assert {:error, expected} == actual
    end
    ExVCR.Config.filter_request_headers(nil)
  end

  test "uploading an image" do
    expected = %Image{description: nil,
                      nsfw: nil,
                      section: nil,
                      title: nil,
                      animated: false,
                      datetime: 1491380311,
                      height: 400,
                      id: "dWWsW7B",
                      link: "http://i.imgur.com/dWWsW7B.jpg",
                      type: "image/jpeg",
                      width: 400}

    ExVCR.Config.filter_request_headers("Authorization")
    use_cassette "upload" do
      actual = Image.upload("test/imgurex/test_image.jpeg")

      assert {:ok, expected} == actual
    end
    ExVCR.Config.filter_request_headers(nil)
  end
end
