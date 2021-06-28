module QuestionsHelper
  OPERATIONS = {
    create: 'Create new',
    edit: 'Edit'
  }.freeze

  def question_header(operation, test)
    "#{OPERATIONS[operation]} #{test.title} question:"
  end
end
