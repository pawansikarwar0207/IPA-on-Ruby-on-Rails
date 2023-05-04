class Admin::QuestionsController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!

  before_action :set_question, only: [:edit, :show, :update, :destroy]

  def index
    @questions = Question.all.page(params[:page])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to admin_questions_path
    else
      render :new
    end
  end

  def show

  end

  def edit

  end


  def update
    if @question.update(question_params)
      redirect_to admin_questions_path
    else
      render :edit
    end
  end


  def destroy
    if @question.destroy
      redirect_to admin_questions_path
    end
  end



  private

  def question_params
    params.require(:question).permit(:title, :keywords, :is_premium, :answer)
  end

  def set_question
    @question = Question.find(params[:id])
  end


end
