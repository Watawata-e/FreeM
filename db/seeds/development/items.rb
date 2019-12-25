names = ["子供服", "机", "パン", "婦人服", "鉛筆", "米"]
random = Random.new(88)
names.each do |name|
  Item.create(
    user_id: random.rand(1..10),
    category_id: random.rand(1..3),
    status_id: random.rand(1..3),
    name: name,
    value: random.rand(1000..10000),
    detail: "aaa",
    stock: random.rand(10)
  )
end
