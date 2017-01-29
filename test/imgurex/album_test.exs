defmodule Imgurex.AlbumTest do
  use ExUnit.Case, async: false

  alias Imgurex.Album
  alias Imgurex.Imgur

  setup_all do
    :meck.new(Imgur)
    on_exit fn -> :meck.unload end
    :ok
  end

  test "creating an anonymous album" do
    expected = %{"id" => "lvyV0",
                 "deletehash" => "5WjtBwpt1aV1v8X"}

    stub = fn("/album",
              "",
              ["Authorization": "Client-ID 12149508e8b758f"]) ->
      %HTTPoison.Response{body: Poison.encode!(%{success: true, data: expected})}
    end
    :meck.expect(Imgur, :post!, stub)

    actual = Album.create("12149508e8b758f")

    assert expected == actual
  end
end
