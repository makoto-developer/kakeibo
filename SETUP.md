# backend

mix phx.new kakeibo --database postgres

mv kakeibo backend
cd backend

config/devのPostgresの情報を更新
mix ecto.create

backend/lib/kakeibo_web/router.ex
-> `scope "/api", KakeiboWeb do`をコメントアウトして以下の行を追加

```elixir
  # Other scopes may use custom stacks.
  scope "/api", KakeiboWeb do
    pipe_through :api
    # 追加
    resources "/users", UserController, except: [:new, :edit]
  end
```