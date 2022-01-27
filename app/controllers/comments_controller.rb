class CommentsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @category = Category.find(params[:category_id])
    @comment.category = @category
    @comment.save
    @form = Form.find(params[:id])
    redirect_to form_category_path(@form, @category)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :min, :max)
  end
end
