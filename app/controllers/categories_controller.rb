class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    @form = Form.find(params[:form_id])
    @category.save
    @form_detail = FormDetail.new(form: @form, category: @category)
    @form_detail.save
    redirect_to form_path(@form)
  end

  private

  def category_params
    params.require(:category).permit(:name, :goal)
  end
end
