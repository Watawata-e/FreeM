names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
0.upto(9) do |idx|
  User.create(
    name: names[idx],
    loginID: names[idx] + "id",
    password: "Pass0",
    password_confirmation: "Pass0"
  )
end

filename = "profile.png"
path = Rails.root.join(__dir__, filename)

1.upto(10) do |idx|
  u = User.find(idx)
  File.open(path) do |f|
    u.profile_picture.attach(io: f, filename: filename)
  end
end
