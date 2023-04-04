class LikesController < ApplicationController

	def create
		@like = current_user.likes.new(like_params)
		if @like.save
			redirect_to questions_path
		end	
	end


	def destroy
		@like = current_user.likes.find(params[:id])
		@like.destroy
		redirect_to questions_path

	end
	
	def like_params
		params.require(:like).permit(:question_id)
	end

end