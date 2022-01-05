class RemoveReferenceToFormDetails < ActiveRecord::Migration[6.0]
  def change
    remove_reference :form_details, :question, foreign_key: true, index: false
  end
end
