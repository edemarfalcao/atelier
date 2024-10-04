class CustomForm < ApplicationRecord
  has_many :custom_form_inputs

  validates :title, presence: true

  accepts_nested_attributes_for :custom_form_inputs
end
