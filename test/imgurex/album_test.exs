defmodule Imgurex.AlbumTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias Imgurex.Album

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes/album")
    HTTPoison.start
  end

  test "creating an anonymous album" do
    expected = %Album{id: "ChP83",
                      deletehash: "ghGmuwuHQ6pUMxN"}

    ExVCR.Config.filter_request_headers("Authorization")
    use_cassette "anonymous" do
      actual = Album.create()

      assert expected == actual
    end
    ExVCR.Config.filter_request_headers(nil)
  end
end
