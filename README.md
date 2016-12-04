# Imgurex

**Adapter for Imgur API**

[![Build Status](https://travis-ci.org/shdblowers/imgurex.svg?branch=master)](https://travis-ci.org/shdblowers/imgurex)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `imgurex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:imgurex, "~> 0.1.0"}]
    end
    ```

  2. Ensure `imgurex` is started before your application:

    ```elixir
    def application do
      [applications: [:imgurex]]
    end
    ```

## Usage

```elixir
client_id = "YOUR ID"
image_id = "THE IMAGE'S ID"

Imgurex.Image.info!(image_id, client_id)
```

```elixir
client_id = "YOUR CLIENT ID"

Imgurex.Image.upload("test/imgurex/test_image.jpeg", client_id)
```