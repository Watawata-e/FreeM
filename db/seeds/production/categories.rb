categories = ["服", "雑貨", "食品", "家電製品", "音楽", "その他"]
categories.each do |category|
  Category.create(category: category)
end
