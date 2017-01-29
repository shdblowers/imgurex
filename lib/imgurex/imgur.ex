defmodule Imgurex.Imgur do
  use HTTPoison.Base

  @base_url Application.fetch_env!(:imgurex, :base_url)

  def process_url(url) do
    @base_url <> url
  end
end
