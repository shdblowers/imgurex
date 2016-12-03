# Imgurex

**Adapter for Imgur API**

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
