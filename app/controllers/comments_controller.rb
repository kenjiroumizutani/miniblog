class CommentsController < ApplicationController
  
  def create
    Comment.create(comment: create_params[:comment], user_id: current_user.id, tweet_id:[:tweet_id])
      # redirect_to :root and return
  end
  
    private
  def create_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id,tweet_id:[:tweet_id])
  end
  
  def update_params
    params.require(:comment).permit(:comment)
  end
end