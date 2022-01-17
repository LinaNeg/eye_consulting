class AddTypeToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :type, :string
  end
end
