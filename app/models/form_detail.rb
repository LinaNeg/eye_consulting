class FormDetail < ApplicationRecord
  belongs_to :form
  belongs_to :question
end
