class AddReferencesToUserAnswers < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_answers, :question, null: false, foreign_key: true
  end
end
