class Category < ApplicationRecord
  has_many :questions
  has_many :form_details
  has_many :forms, through: :form_details

  validates :name, :goal, presence: true
end
