class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :move_to_next_question

  SUCCESS_RATIO = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def move_to_next_question
    self.current_question = next_question
  end

  def completed?
    current_question.nil?
  end

  def succesed?(percent)
    percent >= SUCCESS_RATIO
  end

  def questions
    test.questions
  end

  def correct_percent
    (correct_questions.to_f / questions.count * 100).to_i
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
