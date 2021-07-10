module AnswersHelper
  def answer_header(answer)
    "#{answer.persisted? ? 'Edit' : 'Create new'} answer:"
  end
end
