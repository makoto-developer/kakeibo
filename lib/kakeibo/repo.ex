defmodule Kakeibo.Repo do
  use Ecto.Repo,
    otp_app: :kakeibo,
    adapter: Ecto.Adapters.Postgres
end
