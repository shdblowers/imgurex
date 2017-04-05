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

If [available in Hex](https://hex.pm/docs/publish), the package can be installed by adding `imgurex` to your list of dependencies:

```elixir
def deps do
  [{:imgurex, "~> 0.1.0"}]
end
```

You will also need to set your client id in config:

```elixir
use Mix.Config

config :imgurex,
  client_id: "dNqgBNYyLAmmMAx"
```

## Usage

### Image

#### Getting Image Information

```elixir
iex> image_id = "THE IMAGE'S ID"
iex> Imgurex.Image.info(image_id)
%Imgurex.Image{ ... }
```

#### Uploading an Anonymous Image

```elixir
iex> Imgurex.Image.upload("test/imgurex/test_image.jpeg")
%Imgurex.Image{ ... }
```

### Album

#### Creating an Anonymous Album

```elixir
iex> Imgurex.Album.create(client_id)
%Imgurex.Album{ ... }
```
