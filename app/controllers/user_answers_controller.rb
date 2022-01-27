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

  def index
    @user_answers = UserAnswer.where(user: current_user)
    @form = Form.find(params[:form_id])
    @categories = @form.categories
  end

  def analysis
    @user_answers = UserAnswer.where(user: current_user)
    @form = Form.find(params[:form_id])
    @categories = @form.categories
    @synthesis = []
    @categories.each do |category|
      category_score = 0
      category_best_score = 0
      category.questions.each do |question|
        best_answer = question.answers.order(:score).last
        user_answer = question.user_answers.where(user: current_user).first
        category_score += user_answer.answer.score
        category_best_score += best_answer.score
      end
      infos = { category: category.name,
                score: category_score,
                best_score: category_best_score,
                comment: category.comments.select { |comment| (comment.min .. comment.max).include?(category_score) } }
      @synthesis << infos
    end
  end
end
