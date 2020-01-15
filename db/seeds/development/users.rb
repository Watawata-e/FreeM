names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
0.upto(9) do |idx|
  User.create(
    name: names[idx],
    loginID: names[idx] + "id",
    password: "Pass0",
    password_confirmation: "Pass0"
  )
end
