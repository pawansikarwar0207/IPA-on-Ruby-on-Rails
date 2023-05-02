class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, only: [:create, :destroy, :new, :edit, :update, :show  ]


  def create
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

 def destroy
  @comment = @question.comments.find(params[:id])
  @comment.destroy
  redirect_to questions_path
end

def new
  @comment = @question.comments.new
end

def edit
  respond_to do |format|
    @comment = Comment.find(params[:id])
    format.js
    format.html
  end
end


def update
  @comment = @question.comments.find(params[:id])
  if @comment.update(comment_params)
    flash[:notice] = "Comment has been updated"
    redirect_to questions_path
  else
    flash[:notice] = "Something went wrong."
    render :edit
  end
end


def show
  @comment = @question.comments.build
  render :edit
end


private

def find_comment
  @question = Question.find(params[:question_id])
end

def comment_params
  params.require(:comment).permit(:title, :user_id)
end

end
