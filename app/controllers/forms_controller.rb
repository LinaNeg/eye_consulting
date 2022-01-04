class FormsController < ApplicationController
  def index
    @forms = Form.all
  end

  def show
    @form = Form.find(params[:id])
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    @form.save
    redirect_to form_path(@form)
  end

  private

  def form_params
    params.require(:form).permit(:name, :description)
  end
end
