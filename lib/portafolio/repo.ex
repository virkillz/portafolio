defmodule Portafolio.Repo do
  use Ecto.Repo,
    otp_app: :portafolio,
    adapter: Ecto.Adapters.Postgres
end
