class AddTitleToCustomForms < ActiveRecord::Migration[7.2]
  def change
    add_column :custom_forms, :title, :string
  end
end
