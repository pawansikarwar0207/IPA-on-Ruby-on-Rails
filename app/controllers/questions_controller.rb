class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.user_plans.exists?
      @q = Question.ransack(params[:q])
    else
      @q = Question.is_premium.ransack(params[:q])
    end
    @questions = @q.result(distinct: true).most_liked.eager_load(:likes, :users)
  end

  def show
    @question = Question.find(params[:id])
  end


end
