class UserAnswersController < ApplicationController
  def create
    @user_answer = UserAnswer.new
    @answer = Answer.find(params[:answer_id])
    @user_answer.answer = @answer
    @user_answer.user = current_user
    @user_answer.save
    redirect_to form_question_path
  end
end
