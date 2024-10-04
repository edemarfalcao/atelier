class CustomFormsController < ApplicationController
  before_action :set_custom_form, only: %i[ show edit update destroy ]

  # GET /custom_forms or /custom_forms.json
  def index
    @custom_forms = CustomForm.all
  end

  # GET /custom_forms/1 or /custom_forms/1.json
  def show
    render json: {
      title: @custom_form.title,
      inputs: CustomFormInput.where(custom_form: @custom_form)
    }
  end

  # GET /custom_forms/new
  def new
    @custom_form = CustomForm.new
  end

  # GET /custom_forms/1/edit
  def edit
  end

  # POST /custom_forms or /custom_forms.json
  def create
    custom_form = CustomForm.create!(title: params[:title])

    params[:custom_form_inputs].map do |input|
      CustomFormInput.create!(custom_form: custom_form, label: input[:label], kind: input[:kind], required: input[:required], max_length: input[:max_length], placeholder: input[:placeholder])
    end


    render json: custom_form, status: :created
  end

  # PATCH/PUT /custom_forms/1 or /custom_forms/1.json
  def update
    @custom_form.update!(title: params[:title]) if params[:title].present?

    params[:custom_form_inputs].map do |input|
      CustomFormInput.find(input[:id]).update!(label: input[:label], kind: input[:kind], required: input[:required], max_length: input[:max_length], placeholder: input[:placeholder])
    end

    render json: {
      title: @custom_form.title,
      inputs: CustomFormInput.where(custom_form: @custom_form)
    }
  end

  # DELETE /custom_forms/1 or /custom_forms/1.json
  def destroy
    @custom_form.destroy!

    respond_to do |format|
      format.html { redirect_to custom_forms_path, status: :see_other, notice: "Custom form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_form
      @custom_form = CustomForm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def custom_form_params
      params.fetch(:custom_form, {
        title: params[:title]
      })
    end
end
