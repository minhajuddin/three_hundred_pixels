defmodule ThreeHundredPixels.Repo do
  use Ecto.Repo,
    otp_app: :three_hundred_pixels,
    adapter: Ecto.Adapters.Postgres
end
