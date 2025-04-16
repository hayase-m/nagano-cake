# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.create!(name: 'sweets')
Item.create!(genre_id: 1, name: 'サンプル商品', price: 1111, introduction: 'これはサンプル商品です。')
Address.create!([
                  { customer_id: 1, postal_code: '289-2101', address: '長野県松本市1212', name: '小林たくま' },
                  { customer_id: 1, postal_code: '888-2101', address: '長野県上諏訪市1212', name: '小林はやま' }
                ])
Item.create!(genre_id: 1, name: 'いちごケーキのサンプル', price: 1000, introduction: 'これはいちごケーキのサンプル商品です。')
