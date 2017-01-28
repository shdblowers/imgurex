defmodule Imgurex.AlbumTest do
  use ExUnit.Case, async: false

  alias Imgurex.Album

  setup_all do
    :meck.new(HTTPoison)
    on_exit fn -> :meck.unload end
    :ok
  end

  test "creating an anonymous album" do
    expected = %{"id" => "lvyV0",
                 "deletehash" => "5WjtBwpt1aV1v8X"}

    stub = fn("https://api.imgur.com/3/album",
              "",
              ["Authorization": "Client-ID 12149508e8b758f"]) ->
      %HTTPoison.Response{body: Poison.encode!(%{success: true, data: expected})}
    end
    :meck.expect(HTTPoison, :post!, stub)

    actual = Album.create("12149508e8b758f")

    assert expected == actual
  end
end
