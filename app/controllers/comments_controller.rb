class CommentsController < ApplicationController
  
  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new
    @comment.tweet_id = @tweet.id
  end
  
  def create
    @comment = Comment.create(comment: comment_params[:comment], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
    redirect_to "/tweets/#{@comment.tweet.id}"   #コメントと結びつくツイートの詳細画面に遷移する
  end
  
  private
  def comment_params
    params.permit(:comment, :tweet_id)
  end
  
  def update_params
    params.require(:comment).permit(:comment)
  end
end