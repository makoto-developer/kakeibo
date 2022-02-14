defmodule KakeiboBackend.Repo do
  use Ecto.Repo,
    otp_app: :kakeibo_backend,
    adapter: Ecto.Adapters.Postgres
end
