names = %w(Taro Jiro Hana John Mike)
0.upto(4) do |idx|
  User.create(
    name: names[idx],
    loginID: names[idx] + "id",
    password: "Pass0",
    password_confirmation: "Pass0"
  )
end

1.upto(5) do |idx|
  filename = "#{idx}.png"
  path = File.expand_path("#{filename}", __dir__)
  u = User.find(idx)
  File.open(path) do |f|
    u.profile_picture.attach(io: f, filename: filename)
  end
end
