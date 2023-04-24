class UserReactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    respond_to do |format|
      @question = Question.find(params[:question_id])
      @user_reaction = @question.user_reactions.build(user_reaction_params)
      @user_reaction.user = current_user
      @user_reaction.reaction_type = params[:user_reaction][:reactable_type]
      @user_reaction.reactable = @question

      # Destroy previous user reactions for the same user and question
      previous_reactions = UserReaction.where(user_id: current_user.id, reactable_id: @question.id, reactable_type: "Question")
      previous_reactions.destroy_all


      if @user_reaction.save
        format.html
        format.js
      end
    end
  end


private

def user_reaction_params
  params.require(:user_reaction).permit(:reactable_type, :reactable_id, :user_id)
end
end

