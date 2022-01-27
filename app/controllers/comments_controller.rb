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
    @form = Form.find(params[:form])
    redirect_to form_category_path(@form, @category)
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to form_category_path(@form, @category)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :min, :max)
  end
end
