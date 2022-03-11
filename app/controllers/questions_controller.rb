class QuestionsController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @question = Question.find(params[:id])
    @form = Form.find(params[:form_id])
    @category = @question.category

    @answers = @question.answers
    @questions = @category.questions.order(:id)
    @next_question = @questions.where("id > ?", @question.id).first

    @categories = @form.categories.order(:id)
    @next_category = @categories.where("categories.id > ?", @category.id).first
  end

  def create
    @question = Question.new(question_params)
    @category = Category.find(params[:category_id])
    @question.category = @category
    @question.save
    @form = Form.find(params[:form])
    redirect_to form_path(@form, anchor: "question-#{@question.id}")
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
