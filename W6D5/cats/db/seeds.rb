# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat_1 = Cat.create(name: 'Autumn', color: 'calico', birth_date: '2016-05-21', sex: 'F', description: 'She is my bestest cat ever!')
cat_2 = Cat.create(name: 'Senor Socks', color: 'orange', birth_date: '2018/06/14', sex: 'M', description: 'He is a crazy kitty!')