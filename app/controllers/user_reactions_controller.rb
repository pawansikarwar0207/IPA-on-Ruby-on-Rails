class UserReactionsController < ApplicationController
  def create
    @reactable = find_reactable
    @user_reaction = @reactable.user_reactions.build(user_reaction_params)
    if @user_reaction.save
      redirect_to @reactable
    else
      render :new
    end
  end

  def destroy
    @user_reaction = UserReaction.find(params[:id])
    if @user_reaction.present?
      @user_reaction.destroy
    end
    redirect_to questions_path
  end

  private

  def find_reactable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end

    nil
  end

  def user_reaction_params
    params.require(:user_reaction).permit(:reactable_type, :reactable_id)
  end
end
