class UserReactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @user_reaction = UserReaction.new(user_reaction_params)
    @user_reaction.user = current_user
    @user_reaction.reactable = @question

  # Destroy previous user reactions for the same user and question
  previous_reactions = UserReaction.where(user_id: current_user.id, reactable_id: @question.id, reactable_type: "Question")
  previous_reactions.destroy_all

  if @user_reaction.save
      # Return the updated count of reactions
      render json: { success: true, user_reaction: @user_reaction }
    else
    # Handle failed save
    render json: { success: false, errors: @user_reaction.errors }
  end
end

# def destroy
#   @user_reaction = UserReaction.find(params[:id])
#   @user_reaction.destroy
#   redirect_to questions_path
#   # Handle successful destruction
# end

private

def user_reaction_params
  params.require(:user_reaction).permit(:reactable_type, :reactable_id, :user_id, :reaction, :question_id)
end
end
