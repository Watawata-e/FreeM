names = ["子供服", "机", "パン", "婦人服", "鉛筆", "米"]
random = Random.new(88)
i = 0
names.each do |name|
  Item.create(
    user_id: random.rand(1..10),
    category_id: i % 3 + 1,
    status_id: random.rand(1..3),
    name: name,
    value: random.rand(100..1000),
    detail: "aaa",
    stock: random.rand(20)
  )
  i += 1
end
