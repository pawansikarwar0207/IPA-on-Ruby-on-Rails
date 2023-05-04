class Admin::QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.user_plans.exists?
      @q = Question.ransack(params[:q])
    else
      @q = Question.is_premium.ransack(params[:q])
    end
    @questions = @q.result(distinct: true).most_liked.includes(:likes, :users).page(params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data @q.result.to_csv, filename: "Question-#{DateTime.current}.csv" }
    end
  end

  def show
    @question = Question.find(params[:id])
  end


end
