# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Categories
Category.create(title: 'Rails')
Category.create(title: 'English language')
# Users
User.create(name: 'Niko', login: 'monday101', password: '12345')
User.create(name: 'Alex', login: 'turbo20', password: '54321')
User.create(name: 'Dino', login: 'fastik99', password: '31254275')
# Tests
Test.create(title: 'How are you?', category_id: 2, author_id: 1)
Test.create(title: 'Personal pronouns', category_id: 2, author_id: 1)
Test.create(title: 'HTTP protocol', category_id: 1, author_id: 2)
Test.create(title: 'ORM', category_id: 1, author_id: 2)
# Questions
Question.create(description: 'I __ a new student', test_id: 1)
Question.create(description: 'Manny and Max __ here ', test_id: 1)
Question.create(description: 'What is HTTP protocol?', test_id: 3)
# Answers
Answer.create(description: 'are', question_id: 1)
Answer.create(description: 'am', question_id: 1)
Answer.create(description: 'is', question_id: 1, correct: true)
Answer.create(description: 'is not', question_id: 2)
Answer.create(description: 'arent', question_id: 2)
Answer.create(description: 'aren\'', question_id: 2)
Answer.create(
  description: 'The HTTP is an application layer protocol for distributed, collaborative, hypermedia information systems.', question_id: 3, correct: true
)
Answer.create(description: 'I dont know', question_id: 3)
# Results
Result.create(points: 20, test_id: 1, user_id: 2)
Result.create(points: 100, test_id: 2, user_id: 1)
Result.create(points: 89, test_id: 1, user_id: 1)
