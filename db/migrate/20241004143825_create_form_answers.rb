class CreateFormAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :form_answers do |t|
      t.references :custom_form_input, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
