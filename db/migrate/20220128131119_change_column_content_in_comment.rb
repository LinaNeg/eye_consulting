class ChangeColumnContentInComment < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :content, :text
  end
end
