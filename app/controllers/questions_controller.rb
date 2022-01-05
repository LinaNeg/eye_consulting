class QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    @category = Category.find(params[:category_id])
    @question.category = @category
    @question.save
    @form = Form.find(params[:form])
    redirect_to form_path(@form)
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
