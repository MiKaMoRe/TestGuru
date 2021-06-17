class Answer < ApplicationRecord
  belongs_to :question

  scope :corrects_all, -> { where(correct: true) }

  validates :description, presence: true
  validate :validate_amount_answers

  private

  def validate_amount_answers
    length = question.answers.length
    errors.add(:question_id) if !(0..3).cover?(length)
  end
end
