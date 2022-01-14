class UserAnswersController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id])
    @question = @answer.question
    UserAnswer.where(user: current_user, question: @question).destroy_all
    @user_answer = UserAnswer.new
    @user_answer.question = @question
    @user_answer.answer = @answer
    @user_answer.user = current_user
    @user_answer.save
    @form = Form.find(params[:form_id])
    redirect_to form_question_path(@form, @question)
  end

  def results
    @user_answers = UserAnswer.where(user: current_user)
  end
end
