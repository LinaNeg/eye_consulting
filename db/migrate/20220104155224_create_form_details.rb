class CreateFormDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :form_details do |t|
      t.references :form, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
