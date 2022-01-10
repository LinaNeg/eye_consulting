class AddCompanyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :company, :string
    add_column :users, :activity_area, :string
  end
end
