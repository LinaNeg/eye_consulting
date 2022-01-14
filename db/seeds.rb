# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Form.destroy_all
Answer.destroy_all
Question.destroy_all
Category.destroy_all

test1 = Form.create(name: "La multiplication", description: "Test de connaissance sur les tables de multiplication niveau 2", theme:"Mathématiques")
test2 = Form.create(name: "Doubles et moitiés", description: "Connaissance des doubles et moitiés d'usage courant", theme:"Mathématiques")
test3 = Form.create(name: "Le présent de l'indicatif", description: "Test de connaissance sur la conjugaison des verbes au présent de l'indicatif", theme:"Conjugaison")
test4 = Form.create(name: "Le futur de l'indicatif", description: "Test de connaissance sur la conjugaison des verbes au futur de l'indicatif", theme:"Conjugaison")

category1 = Category.create(name: 'Table de 7', goal: 'Connaitre la table de 7')
category2 = Category.create(name: 'Table de 6', goal: 'Connaitre la table de 6')
category3 = Category.create(name: 'Table de 8', goal: 'Connaitre la table de 8')
category4 = Category.create(name: 'Les verbes du 1er groupe', goal: 'Connaître ses terminaison et les cas particuliers')
category5 = Category.create(name: 'Les verbes du 3è groupe', goal: 'Connaître les changements dans le radical')

FormDetail.create(form_id: test1.id, category_id: category1.id)
FormDetail.create(form_id: test1.id, category_id: category2.id)
FormDetail.create(form_id: test1.id, category_id: category3.id)
FormDetail.create(form_id: test3.id, category_id: category4.id)
FormDetail.create(form_id: test3.id, category_id: category5.id)

question1 = Question.create(content: '7*6', category_id: category1.id)
question2 = Question.create(content: '7*9', category_id: category1.id)
question3 = Question.create(content: '7*7', category_id: category1.id)
question4 = Question.create(content: '6*6', category_id: category2.id)
question5 = Question.create(content: '6*8', category_id: category2.id)
question6 = Question.create(content: '6*9', category_id: category2.id)
question7 = Question.create(content: '8*7', category_id: category3.id)
question8 = Question.create(content: '8*9', category_id: category3.id)
question9 = Question.create(content: '8*8', category_id: category3.id)

Answer.create(content: '48', score: '0', question_id: question1.id)
Answer.create(content: '42', score: '3', question_id: question1.id)
Answer.create(content: '44', score: '0', question_id: question1.id)
Answer.create(content: '63', score: '3', question_id: question2.id)
Answer.create(content: '61', score: '0', question_id: question2.id)
Answer.create(content: '67', score: '0', question_id: question2.id)
Answer.create(content: '57', score: '0', question_id: question3.id)
Answer.create(content: '53', score: '0', question_id: question3.id)
Answer.create(content: '49', score: '3', question_id: question3.id)
Answer.create(content: '34', score: '0', question_id: question4.id)
Answer.create(content: '36', score: '3', question_id: question4.id)
Answer.create(content: '12', score: '0', question_id: question4.id)
Answer.create(content: '38', score: '0', question_id: question5.id)
Answer.create(content: '40', score: '0', question_id: question5.id)
Answer.create(content: '48', score: '3', question_id: question5.id)
Answer.create(content: '48', score: '0', question_id: question6.id)
Answer.create(content: '54', score: '3', question_id: question6.id)
Answer.create(content: '52', score: '0', question_id: question6.id)
Answer.create(content: '56', score: '3', question_id: question7.id)
Answer.create(content: '63', score: '0', question_id: question7.id)
Answer.create(content: '53', score: '0', question_id: question7.id)
Answer.create(content: '54', score: '0', question_id: question8.id)
Answer.create(content: '81', score: '0', question_id: question8.id)
Answer.create(content: '72', score: '3', question_id: question8.id)
Answer.create(content: '72', score: '0', question_id: question9.id)
Answer.create(content: '64', score: '3', question_id: question9.id)
Answer.create(content: '56', score: '0', question_id: question9.id)
