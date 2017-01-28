## Imgurex

[![Build Status](https://travis-ci.org/shdblowers/imgurex.svg?branch=master)](https://travis-ci.org/shdblowers/imgurex)
[![Coverage Status](https://coveralls.io/repos/github/shdblowers/imgurex/badge.svg?branch=master)](https://coveralls.io/github/shdblowers/imgurex?branch=master)
[![Ebert](https://ebertapp.io/github/shdblowers/imgurex.svg)](https://ebertapp.io/github/shdblowers/imgurex)

**Adapter for Imgur API**

Imgur is an online image hosting and sharing community. The aim of this package is to allow Elixir users to be able to easily interact with the Imgur API.

[Imgur API Documentation](https://api.imgur.com/)

## Getting Started

In order to start using the API you need to register in order to receive a client id and client secret. This can be done on the [Register an Application](https://api.imgur.com/oauth2/addclient?) page on the Imgur website.

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

### Image

#### Getting Image Information

```elixir
client_id = "YOUR ID"
image_id = "THE IMAGE'S ID"

Imgurex.Image.info(client_id, image_id)
```

#### Uploading an Anonymous Image

```elixir
client_id = "YOUR CLIENT ID"

Imgurex.Image.upload(client_id, "test/imgurex/test_image.jpeg")
```

### Album

#### Creating an Anonymous Album

```elixir
client_id = "YOUR CLIENT ID"
Imgurex.Album.create(client_id)
```
