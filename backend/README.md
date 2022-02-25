# Kakeibo Backend

## 起動

```zsh
mix phx.server
```

スキーマ作成
```elixir
mix phx.gen.json Accounts User users name:string age:integer
mix phx.gen.json Accounts Balance balance day:date title:string expense:integer income:integer method:string who:string

# 最後に必ず実行
mix ecto.migrate
```

## API

投入
```zsh
# User
curl -X POST -H "Content-type: application/json" -d '{"name":"tom","age": 20}' http://localhost:4000/api/users
curl -X POST -H "Content-type: application/json" -d '{"name":"alice","age": 23}' http://localhost:4000/api/users


# Balance
# NG date型のフォーマットが間違っている
#curl -X POST -H "Content-type: application/json" -d '{"balance":{"day": "2022/2/25", "title":"振り", "expense":0, "income":250000, "who":"tom"}}' http://localhost:4000/api/balance
curl -X POST -H "Content-type: application/json" -d '{"day": { "day": 25, "month": 1, "year":2022}, "title":"振り", "expense":0, "income":250000, "method": "三菱UFJ", "who":"tom"}' http://localhost:4000/api/balance
curl -X POST -H "Content-type: application/json" -d '{"day": { "day": 25, "month": 1, "year":2022}, "title":"昼ごはん", "expense":2000, "income":0, "method": "現金", "who":"alice"}' http://localhost:4000/api/balance
curl -X POST -H "Content-type: application/json" -d '{"day": { "day": 23, "month": 1, "year":2022}, "title":"ジュース", "expense":198, "income":0, "method": "現金", "who":"alice"}' http://localhost:4000/api/balance


```

取得

```zsh
curl  http://localhost:4000/api/users/1
curl  http://localhost:4000/api/balance/1
```