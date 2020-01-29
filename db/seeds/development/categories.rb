categories = ["服", "雑貨", "家電製品", "音楽", "文房具", "その他"]
categories.each do |category|
  Category.create(category: category)
end
