class Question < ApplicationRecord
  belongs_to :category
  has_many :answers
  has_many :form_details
end
