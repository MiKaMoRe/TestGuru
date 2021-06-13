# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Categories
categories = Category.create!([
  { title: 'Rails' },
  { title: 'English language' }
])
# Users
users = User.create!([
  { name: 'Niko', login: 'monday101', password: '12345' },
  { name: 'Alex', login: 'turbo20', password: '54321' },
  { name: 'Dino', login: 'fastik99', password: '31254275' }
])
# Tests
tests = Test.create!([
  { title: 'How are you?', category_id: categories[1].id, author_id: users[0].id },
  { title: 'Personal pronouns', category_id: categories[1].id, author_id: users[0].id },
  { title: 'HTTP protocol', category_id: categories[0].id, author_id: users[1].id },
  { title: 'ORM', category_id: categories[0].id, author_id: users[1].id },
  { title: 'Rails models', category_id: categories[0].id, author_id: users[1].id, level: 1 }
])
# Questions
questions = Question.create!([
  { description: 'I __ a new student', test_id: tests[0].id },
  { description: 'Manny and Max __ here ', test_id: tests[0].id },
  { description: 'What is HTTP protocol?', test_id: tests[2].id }
])
# Answers
answers = Answer.create!([
  { description: 'are', question_id: questions[0].id },
  { description: 'am', question_id: questions[0].id },
  { description: 'is', question_id: questions[0].id, correct: true },
  { description: 'is not', question_id: questions[1].id },
  { description: 'arent', question_id: questions[1].id },
  { description: 'aren\'', question_id: questions[1].id },
  {
    description: 'The HTTP is an application layer protocol for distributed, collaborative, hypermedia information systems.',
    question_id: questions[2].id,
    correct: true
  },
  { description: 'I dont know', question_id: questions[2].id }
])
# Results
results = Result.create!([
  { points: 20, test_id: tests[0].id, user_id: users[1].id },
  { points: 100, test_id: tests[1].id, user_id: users[0].id },
  { points: 89, test_id: tests[2].id, user_id: users[0].id },
  { points: 70, test_id: tests[4].id, user_id: users[1].id }
])
TestsUser
tests_user = TestsUser.create!([
  { test_id: tests[1].id, user_id: users[0].id, progress: 100 },
  { test_id: tests[0].id, user_id: users[0].id },
  { test_id: tests[2].id, user_id: users[1].id },
  { test_id: tests[0].id, user_id: users[1].id, progress: 56 }
])
