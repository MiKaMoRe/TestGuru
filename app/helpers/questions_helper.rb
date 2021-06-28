module QuestionsHelper
  def question_header(question, test)
    "#{question.persisted? ? 'Edit' : 'Create new'} #{test.title} question:"
  end
end
