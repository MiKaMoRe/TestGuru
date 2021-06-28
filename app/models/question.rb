class Question < ApplicationRecord
  belongs_to :test, dependent: :delete

  has_many :answers, dependent: :destroy

  validates :description, presence: true
end
