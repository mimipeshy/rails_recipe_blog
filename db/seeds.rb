# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(id: 1, name: 'cakes', priority: 1)
Category.create(id: 2, name: 'pastries', priority: 2)
Category.create(id: 3, name: 'drinks', priority: 3)
Category.create(id: 4, name: 'food', priority: 4)
