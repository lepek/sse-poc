# Check out https://github.com/joshbuddy/http_router for more information on HttpRouter
HttpRouter.new do
  add('/').to(GetNewOrdersAction)
  add('/new_order').to(NewOrderAction)
end
