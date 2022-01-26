class CommentsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @comment = Comment.new
  end

  def create
    @category = Category.find(params[:category_id])
    @comment = Comment.new(comment_params)
    @comment.category = @category
    @comment.save
    @form = Form.find(params[:form])
    redirect_to form_category_path(@form, @category)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :min, :max)
  end
end
