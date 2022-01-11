class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.question = @question
    @answer.save
    #@form = Form.find(params[:form])
    #@form = Form.joins(:form_details).where(form_details: { category: @category })
    redirect_to form_path(@form)
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :score)
  end
end
