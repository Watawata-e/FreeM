table_names = %w(users statuses categories items admin comments)
table_names.each do |table_name|
  path = Rails.root.join("db/seeds", Rails.env, table_name + ".rb")
  if File.exist?(path)
    puts "大倉さんが #{table_name} を作ってくれてるよ！！！"
    require path
  end
end
