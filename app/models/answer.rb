class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :description, presence: true
  validate :validate_amount_answers, on: :create

  private

  def validate_amount_answers
    amount = question.answers.count
    errors.add(:question_id) unless (0..3).cover?(amount)
  end
end
