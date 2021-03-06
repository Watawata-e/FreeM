user = %w(1 2 3 4 5 1 2 3 4 5 1 2 3)
category = %w(2 4 4 4 4 2 1 1 3 3 2 5 5)
status = %w(2 3 3 3 3 2 1 2 3 2 3 3 3)
name = %w(大倉ぬいぐるみセット 関ジャニジャムCD 関ジャニデビューCD 関ジャニ8ESTDVD 関ジャニJAMDVD 大倉缶バッジ 関ジャニパーカー 関ジャニTシャツ テレビ レコーダー 関ジャニバッグ 大倉ファイル カレーマスキングテープ)
value = %w(4000 1500 300 5000 5000 1200 3000 1000 20000 30000 2000 2000 300)
detail = %w(とても可愛いです。 初回限定盤Bです。一度PCで再生したのみです。 関西限定版です。 初回限定盤です。 初回限定盤です。 8ESTの缶バッジ。緑を集めました。 47ツアーのパーカー。新品です。 JAMツアーのTシャツです。 6年ほど使用していました。動作は良好です。 2019年9月に購入したばかりです。あまり使用していません。 関ジャニとCHMUSのコラボバッグです。大倉くんが目立つデザインです。 十五祭会場限定ファイル札幌です。大倉くんのドラムデザインです。 カレーデザインが可愛いマスキングテープです。大倉くんも好きなカレーです。)
stock = %w(13 42 3 12 4 55 62 24 9 31 53 15 4)
0.upto(12) do |idx|
  Item.create(
    user_id: user[idx],
    category_id: category[idx],
    status_id: status[idx],
    name: name[idx],
    value: value[idx],
    detail: detail[idx],
    stock: stock[idx]
  )
end

1.upto(13) do |idx|
  filename = "#{idx}a.png"
  path = File.expand_path("#{filename}", __dir__)
  i = Item.find(idx)
  File.open(path) do |f|
    i.item_picture.attach(io: f, filename: filename)
  end
end

