class Question < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :user_answers, dependent: :destroy

  validates :content, presence: true
end
