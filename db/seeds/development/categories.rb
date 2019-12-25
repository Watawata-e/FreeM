categories = ["服", "雑貨", "食品"]
categories.each do |category|
  Category.create(category: category)
end
