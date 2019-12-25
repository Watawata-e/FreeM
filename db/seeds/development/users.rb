names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
0.upto(9) do |idx|
  User.create(
    name: names[idx],
    loginID: "aaa",
    password: "pass",
    password_confirmation: "pass"
  )
end
