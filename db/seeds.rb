# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Category.destroy_all
# Question.destroy_all

Category.create!(name: 'Business model', goal: 'Dans cette 1ère partie, nous identifierons les actions que vous avez menées ou entreprises afin de développer votre "e-business')
Category.create!(name: 'Produits et services', goal: '#')

Question.create!(content: 'Êtes vous visible sur les canaux numériques (site web, google my business, linked in, facebook, instagram…) ?', category_id: 1)
Question.create!(content: 'Votre offre de services/produits est-elle accessible sur des canaux digitaux ?', category_id: 2)
