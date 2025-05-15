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
Item.create!(genre_id: 1, name: 'いちごケーキのサンプル', price: 1000, introduction: 'これはいちごケーキのサンプル商品です。')
# Admin.create!(email: 'mrym.124.hys@gmail.com', password: 'hayase0124')

# Genre データが存在しない場合に備え、いくつか作成または取得
# genre_cake = Genre.find_or_create_by!(name: 'ケーキ')
# genre_pudding = Genre.find_or_create_by!(name: 'プリン')
# genre_baked = Genre.find_or_create_by!(name: '焼き菓子')
# all_genres = [genre_cake, genre_pudding, genre_baked]

# # 既存の Item データをクリアしたい場合は以下のコメントを外す
# Item.destroy_all

# 10.times do |i|
#   item_number = i + 1
#   Item.create!(
#     genre: all_genres.sample,
#     name: "サンプル商品 #{item_number}",
#     introduction: "これはサンプル商品 #{item_number} の説明文です。美味しいですよ。",
#     price: rand(300..3000), # 300円から3000円のランダムな価格
#     is_active: item_number <= 8 # 8番目までの商品は販売中、残りは停止中とする例
#   )
# end

# Customer.delete_all

# Customer.create!([
#                    { last_name: '山田', first_name: '花子', last_name_kana: 'ヤマダ', first_name_kana: 'ハナコ', email: 'hoge@exaple.com',
#                      password: 'password', is_active: true, postal_code: '1000001', address: '東京都千代田区千代田1-1', telephone_number: '0311111111' },
#                    { last_name: '松尾', first_name: '数雄', last_name_kana: 'マツオ', first_name_kana: 'カズオ', email: 'bbb@tet.jp',
#                      password: 'password', is_active: true, postal_code: '1500001', address: '東京都渋谷区神宮前1-1-1', telephone_number: '0333333333' },
#                    { last_name: '越智', first_name: '龍乃看', last_name_kana: 'オチ', first_name_kana: 'リュウノカン', email: 'cc@test.jp',
#                      password: 'password', is_active: true, postal_code: '5300001', address: '大阪府大阪市北区梅田1-1-1', telephone_number: '0666666666' },
#                    { last_name: '宮下', first_name: '章音', last_name_kana: 'ミヤシタ', first_name_kana: 'アキネ', email: 'ddd@est.jp',
#                      password: 'password', is_active: true, postal_code: '4600001', address: '愛知県名古屋市中区栄1-1-1', telephone_number: '0522222222' },
#                    { last_name: '棚橋', first_name: '遥菜', last_name_kana: 'タナハシ', first_name_kana: 'ハルナ', email: 'eee@tst.jp',
#                      password: 'password', is_active: true, postal_code: '9800001', address: '宮城県仙台市青葉区中央1-1-1', telephone_number: '0224444444' },
#                    { last_name: '大野', first_name: '愛帆', last_name_kana: 'オオノ', first_name_kana: 'アイホ', email: 'fff@tet.jp',
#                      password: 'password', is_active: true, postal_code: '0600001', address: '北海道札幌市中央区北1条西1-1-1', telephone_number: '0115555555' },
#                    { last_name: '花井', first_name: '喜暢', last_name_kana: 'ハナイ', first_name_kana: 'ヨシノブ', email: 'ggg@est.jp',
#                      password: 'password', is_active: false, postal_code: '7300001', address: '広島県広島市中区紙屋町1-1-1', telephone_number: '0827777777' },
#                    { last_name: '金沢', first_name: '秀子', last_name_kana: 'カナザワ', first_name_kana: 'ヒデコ', email: 'hh@test.jp',
#                      password: 'password', is_active: true, postal_code: '9200001', address: '石川県金沢市広坂1-1-1', telephone_number: '0768888888' },
#                    { last_name: '前田', first_name: '里沙', last_name_kana: 'マエダ', first_name_kana: 'リサ', email: 'iii@tst.jp',
#                      password: 'password', is_active: true, postal_code: '8100001', address: '福岡県福岡市中央区天神1-1-1', telephone_number: '0929999999' },
#                    { last_name: '小野', first_name: '長次郎', last_name_kana: 'オノ', first_name_kana: 'チョウジロウ', email: 'jj@test.jp',
#                      password: 'password', is_active: false, postal_code: '9000001', address: '沖縄県那覇市泉崎1-1-1', telephone_number: '0981234567' }
#                  ])
