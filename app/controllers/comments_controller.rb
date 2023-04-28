class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
     flash[:notice] = "Comment has been created"
     redirect_to questions_path
   else
     flash[:notice] = "Something went wrong."
     redirect_to questions_path
   end 
 end

 def show
  @question = Question.find(params[:id])
end

 def destroy
  @question = Question.find(params[:question_id])
  @comment = @question.comments.find(params[:id])
  @comment.destroy
  redirect_to questions_path
end

private

def comment_params
  params.require(:comment).permit(:title, :user_id)
end

end
