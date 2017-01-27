## Imgurex

Imgur is an online image hosting and sharing community. The aim of this package is to allow Elixir users to be able to easily interact with the Imgur API.

[Imgur API Documentation](https://api.imgur.com/)

**Adapter for Imgur API**

[![Build Status](https://travis-ci.org/shdblowers/imgurex.svg?branch=master)](https://travis-ci.org/shdblowers/imgurex) [![Coverage Status](https://coveralls.io/repos/github/shdblowers/imgurex/badge.svg?branch=master)](https://coveralls.io/github/shdblowers/imgurex?branch=master) [![Ebert](https://ebertapp.io/github/shdblowers/imgurex.svg)](https://ebertapp.io/github/shdblowers/imgurex)

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

```elixir
client_id = "YOUR ID"
image_id = "THE IMAGE'S ID"

Imgurex.Image.info(image_id, client_id)
```

```elixir
client_id = "YOUR CLIENT ID"

Imgurex.Image.upload("test/imgurex/test_image.jpeg", client_id)
```
