class AddThemeToForms < ActiveRecord::Migration[6.0]
  def change
    add_column :forms, :theme, :string
  end
end
