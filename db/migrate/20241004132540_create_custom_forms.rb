class CreateCustomForms < ActiveRecord::Migration[7.2]
  def change
    create_table :custom_forms do |t|
      t.timestamps
    end
  end
end
