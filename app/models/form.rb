class Form < ApplicationRecord
  has_many :form_details
  has_many :questions, through: :form_details
end
