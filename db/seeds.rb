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
                                { title: 'Ruby' }
                              ])
# Users
users = User.create!([
                       { nickname: 'Niko', email: 'mon@mail.ru', password: '123456' },
                       { nickname: 'Alex', email: 'aaa@mail.ru', password: '543216' },
                       { nickname: 'Dino', email: 'ddd@mail.ru', password: '31254275' },
                       {
                         nickname: 'mikamore',
                         email: 'kim.roman-2002@yandex.ru',
                         password: '123456',
                         first_name: 'roman',
                         last_name: 'kim',
                         type: 'Admin'
                       }
                     ])
# Tests
tests = Test.create!([
                       { title: 'How are you?', category: categories[1], author: users[0] },
                       { title: 'Personal pronouns', category: categories[1], author: users[0] },
                       { title: 'HTTP protocol', category: categories[0], author: users[1] },
                       { title: 'Rails models', category: categories[0], author: users[1], level: 2 },
                       { title: 'Ruby', category: categories[2], author: users[0] },
                     ])
# Questions
questions = Question.create!([
                               { description: 'I __ a new student', test: tests[0] },
                               { description: 'Manny and Max __ here ', test: tests[0] },
                               { description: '__ am sitting on the sofa. ', test: tests[1] },
                               { description: '__ are watching TV. ', test: tests[1] },
                               { description: 'What is HTTP protocol?', test: tests[2] },
                               { description: 'Что такое Ruby?', test: tests[4] },
                               { description: 'Какой ruby язык программирования?', test: tests[4] },
                               { description: 'Что такое Ruby on rails?', test: tests[3] },
                               { description: 'Для чего используется Ruby on rails?', test: tests[3] },
                             ])
# Answers
Answer.create!([
                 { description: 'are', question: questions[0] },
                 { description: 'am', question: questions[0] },
                 { description: 'is', question: questions[0], correct: true },
                 { description: 'is not', question: questions[1] },
                 { description: 'arent', question: questions[1], correct: true },
                 { description: 'aren\'', question: questions[1] },
                 {
                   description: 'The HTTP is an application layer protocol for distributed, collaborative, hypermedia information systems.',
                   question: questions[4],
                   correct: true
                 },
                 { description: 'I dont know', question: questions[4] },
                 { description: 'I', question: questions[2], correct: true },
                 { description: 'They', question: questions[2] },
                 { description: 'You', question: questions[2] },
                 { description: 'He', question: questions[3] },
                 { description: 'We', question: questions[3], correct: true },
                 { description: 'It', question: questions[3] },
                 { description: 'Язык программирования', question: questions[5], correct: true },
                 { description: 'Драгоценный камень', question: questions[5] },
                 { description: 'Что-то съедобное', question: questions[5] },
                 { description: 'Интерпритируемый', question: questions[6], correct: true },
                 { description: 'Компилируемый', question: questions[6] },
                 { description: 'Фреймворк', question: questions[7], correct: true },
                 { description: 'Незнаю', question: questions[7] },
                 { description: 'Для веб-разработки', question: questions[8], correct: true },
                 { description: 'Для разработки игр', question: questions[8] },
               ])
# Badges
badges = Badge.create!([
                        { 
                          title: 'Rails', 
                          description: 'Pass all Rails category',
                          rule: 'all_tests_by_category',
                          rule_value: '1',
                          image_url: 'rails.png'
                        },
                        { 
                          title: 'Ruby', 
                          description: 'Pass all Ruby category',
                          rule: 'all_tests_by_category',
                          rule_value: '3',
                          image_url: 'ruby.png'
                        },
                        { 
                          title: 'First step', 
                          description: 'Pass your first test',
                          rule: 'all_pass_first_test',
                          rule_value: '',
                          image_url: 'first-step.png'
                        }
                      ])
