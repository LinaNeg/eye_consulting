class AddReferenceToFormDetails < ActiveRecord::Migration[6.0]
  def change
    add_reference :form_details, :category, foreign_key: true
  end
end
