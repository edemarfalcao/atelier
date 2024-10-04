class CreateCustomFormInputs < ActiveRecord::Migration[7.2]
  def change
    create_table :custom_form_inputs do |t|
      t.string :label
      t.boolean :required
      t.integer :max_length
      t.string :placeholder
      t.integer :type
      t.string :options
      t.references :custom_form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
