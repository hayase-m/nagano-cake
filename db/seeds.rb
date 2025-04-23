# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Genre.create!(name: 'sweets')
# Item.create!(genre_id: 1, name: 'サンプル商品', price: 1111, introduction: 'これはサンプル商品です。')
# Address.create!([
#                   { customer_id: 1, postal_code: '289-2101', address: '長野県松本市1212', name: '小林たくま' },
#                   { customer_id: 1, postal_code: '888-2101', address: '長野県上諏訪市1212', name: '小林はやま' }
#                 ])
# Item.create!(genre_id: 1, name: 'いちごケーキのサンプル', price: 1000, introduction: 'これはいちごケーキのサンプル商品です。')
# Admin.create!(email: 'mrym.124.hys@gmail.com', password: 'hayase0124')

# Genre データが存在しない場合に備え、いくつか作成または取得
genre_cake = Genre.find_or_create_by!(name: 'ケーキ')
genre_pudding = Genre.find_or_create_by!(name: 'プリン')
genre_baked = Genre.find_or_create_by!(name: '焼き菓子')
all_genres = [genre_cake, genre_pudding, genre_baked]

# 既存の Item データをクリアしたい場合は以下のコメントを外す
# Item.destroy_all

10.times do |i|
  item_number = i + 1
  Item.create!(
    genre: all_genres.sample,
    name: "サンプル商品 #{item_number}",
    introduction: "これはサンプル商品 #{item_number} の説明文です。美味しいですよ。",
    price: rand(300..3000), # 300円から3000円のランダムな価格
    is_active: item_number <= 8 # 8番目までの商品は販売中、残りは停止中とする例
  )
end
