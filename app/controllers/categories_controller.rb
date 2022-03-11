class CategoriesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @form = Form.find(params[:form_id])
    @category = Category.find(params[:id])
    @comments = @category.comments
    @comment = Comment.new
  end

  def user_show
    @form = Form.find(params[:form_id])
    @categories = @form.categories.order(:id)
    @category = Category.find(params[:id])
    @next_category = @categories.where("categories.id > ?", @category.id).first
    @questions = @category.questions
  end

  def create
    @category = Category.new(category_params)
    @form = Form.find(params[:form_id])
    @category.save
    @form_detail = FormDetail.new(form: @form, category: @category)
    @form_detail.save
    redirect_to form_path(@form, anchor: "category-#{@category.id}")
  end

  private

  def category_params
    params.require(:category).permit(:name, :goal)
  end
end
