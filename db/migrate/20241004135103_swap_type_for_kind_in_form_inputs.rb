class SwapTypeForKindInFormInputs < ActiveRecord::Migration[7.2]
  def change
    rename_column :custom_form_inputs, :type, :kind
  end
end
