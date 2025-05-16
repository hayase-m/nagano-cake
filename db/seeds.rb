# 管理者アカウント
Admin.find_or_create_by!(email: 'admin@example.com') do |admin|
  admin.password = 'password'
end

# ジャンル10種
genre_names = %w[ケーキ 焼き菓子 プリン キャンディ チョコレート パイ タルト シュークリーム ゼリー マカロン]
genres = genre_names.map { |name| Genre.find_or_create_by!(name: name) }

# 顧客10人
10.times do |i|
  Customer.find_or_create_by!(email: "customer#{i + 1}@example.com") do |c|
    c.last_name = "姓#{i + 1}"
    c.first_name = "名#{i + 1}"
    c.last_name_kana = "セイ#{i + 1}"
    c.first_name_kana = "メイ#{i + 1}"
    c.password = 'password'
    c.is_active = true
    c.postal_code = "100000#{i + 1}"
    c.address = "東京都テスト区#{i + 1}-1-1"
    c.telephone_number = "03111111#{format('%02d', i + 1)}"
  end
end

# 商品10種以上
20.times do |i|
  Item.find_or_create_by!(name: "サンプル商品#{i + 1}") do |item|
    item.genre = genres[i % genres.size]
    item.introduction = "これはサンプル商品#{i + 1}の説明です。"
    item.price = 500 + i * 50
    item.is_active = true
  end
end
