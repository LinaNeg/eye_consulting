class Form < ApplicationRecord
  has_many :form_details, dependent: :destroy
  has_many :categories, through: :form_details

  validates :name, :description, presence: true
end
