class FormsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :user_show, :user_index ]
  before_action :set_form, only: [:show, :edit, :update, :destroy]
  def index
    @forms = Form.all
  end

  def user_index
    @forms = Form.all
  end

  def show
    @categories = Category.joins(:form_details).where(form_details: { form: @form })
    @category = Category.new
    @question = Question.new
    @answer = Answer.new
  end

  def user_show
    @form = Form.find(params[:id])
    @categories = @form.categories
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    @form.save
    redirect_to form_path(@form)
  end

  def edit
  end

  def update
    @form.update(form_params)
    redirect_to form_path(@form)
  end

  def destroy
    @form.destroy
    redirect_to forms_path
  end

  private

  def set_form
    @form = Form.find(params[:id])
  end

  def form_params
    params.require(:form).permit(:name, :description, :theme)
  end
end
