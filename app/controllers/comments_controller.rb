class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/quizzes/#{comment.quiz.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, quiz_id: params[:quiz_id])
  end
end
