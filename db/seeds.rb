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
  { title: 'How are you?', category: categories[1], author: users[0] },
  { title: 'Personal pronouns', category: categories[1], author: users[0] },
  { title: 'HTTP protocol', category: categories[0], author: users[1] },
  { title: 'ORM', category: categories[0], author: users[1], level: 5 },
  { title: 'Rails models', category: categories[0], author: users[1], level: 2 }
])
# Questions
questions = Question.create!([
  { description: 'I __ a new student', test: tests[0] },
  { description: 'Manny and Max __ here ', test: tests[0] },
  { description: 'What is HTTP protocol?', test: tests[2] }
])
# Answers
answers = Answer.create!([
  { description: 'are', question: questions[0] },
  { description: 'am', question: questions[0] },
  { description: 'is', question: questions[0], correct: true },
  { description: 'is not', question: questions[1] },
  { description: 'arent', question: questions[1] },
  { description: 'aren\'', question: questions[1] },
  {
    description: 'The HTTP is an application layer protocol for distributed, collaborative, hypermedia information systems.',
    question: questions[2],
    correct: true
  },
  { description: 'I dont know', question: questions[2] }
])
# TestsUser
tests_user = TestsUser.create!([
  { test: tests[1], user: users[0], progress: 100, points: 87 },
  { test: tests[0], user: users[0], progress: 100, points: 45 },
  { test: tests[2], user: users[1] },
  { test: tests[0], user: users[1], progress: 56 , points: 10}
])
