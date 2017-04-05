defmodule Imgurex.Imgur do
  @moduledoc """
  Overrides for default HTTPoison methods to interact with Imgur API.
  """

  use HTTPoison.Base

  @base_url Application.fetch_env!(:imgurex, :base_url)

  @spec process_url(binary) :: binary
  def process_url(url) do
    @base_url <> url
  end
end
