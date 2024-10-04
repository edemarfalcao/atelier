class CustomFormInput < ApplicationRecord
  belongs_to :custom_form

  validates :label, :kind,   presence: true

  enum kind: {
    text: 0,
    number: 1,
    date: 2,
    select_field: 3
  }
end
