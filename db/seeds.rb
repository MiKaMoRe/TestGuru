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
                                { title: 'English language' },
                                { title: 'Информатика' }
                              ])
# Users
users = User.create!([
                       { name: 'Niko', email: 'mon@mail.ru', password_digest: '12345' },
                       { name: 'Alex', email: 'aaa@mail.ru', password_digest: '54321' },
                       { name: 'Dino', email: 'ddd@mail.ru', password_digest: '31254275' }
                     ])
# Tests
tests = Test.create!([
                       { title: 'How are you?', category: categories[1], author: users[0] },
                       { title: 'Personal pronouns', category: categories[1], author: users[0] },
                       { title: 'HTTP protocol', category: categories[0], author: users[1] },
                       { title: 'ORM', category: categories[0], author: users[1], level: 5 },
                       { title: 'Rails models', category: categories[0], author: users[1], level: 2 },
                       { title: 'Windows', category: categories[2], author: users[0] }
                     ])
# Questions
questions = Question.create!([
                               { description: 'I __ a new student', test: tests[0] },
                               { description: 'Manny and Max __ here ', test: tests[0] },
                               { description: 'What is HTTP protocol?', test: tests[2] },
                               { description: 'Единицей измерения информации является:', test: tests[5] },
                               {
                                 description: 'Какая система счисления используется при представлении числа в памяти компьютера:', test: tests[5]
                               },
                               { description: 'Какие из перечисленных ниже устройств являются устройствами ввода',
                                 test: tests[5] }
                             ])

Answer.create!([
                 { description: 'are', question: questions[0] },
                 { description: 'am', question: questions[0] },
                 { description: 'is', question: questions[0], correct: true },
                 { description: 'is not', question: questions[1] },
                 { description: 'arent', question: questions[1], correct: true },
                 { description: 'aren\'', question: questions[1] },
                 {
                   description: 'The HTTP is an application layer protocol for distributed, collaborative, hypermedia information systems.',
                   question: questions[2],
                   correct: true
                 },
                 { description: 'I dont know', question: questions[2] },
                 { description: 'бод', question: questions[3] },
                 { description: 'бит', question: questions[3], correct: true },
                 { description: 'ампер', question: questions[3] },
                 { description: 'герц', question: questions[3] },
                 { description: 'десятичная', question: questions[4] },
                 { description: 'двоичная', question: questions[4], correct: true },
                 { description: 'троичная', question: questions[4] },
                 { description: 'шестидесятеричная', question: questions[4] },
                 { description: 'клавиатура', question: questions[5], correct: true },
                 { description: 'дискета', question: questions[5] },
                 { description: 'сканер', question: questions[5], correct: true },
                 { description: 'дисплей', question: questions[5] }
               ])
