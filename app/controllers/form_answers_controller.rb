class FormAnswersController < ApplicationController
  def create
    params[:form_answers].map do |answer|
      FormAnswer.create!(custom_form_input: CustomFormInput.find(answer[:custom_form_input_id]), value: answer[:value])
    end

    render json: {
      message: "Form answers were successfully submitted."
    }, status: :created
  end
end
