class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.question = @question
    @answer.save
    @form = Form.find(params[:form])
    redirect_to form_path(@form, anchor: "answer-#{@answer.id}")
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    @form = Form.find(params[:form])
    redirect_to form_path(@form)
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :score)
  end
end
