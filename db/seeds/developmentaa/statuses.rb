statuses = ["新品・未使用", "未使用に近い", "使用感あり"]
statuses.each do |status|
  Status.create(status: status)
end
