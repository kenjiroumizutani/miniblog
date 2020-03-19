class TweetsController < ApplicationController
  def index
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
    @comment = Comment.new
  end
  
  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
    @comment = Comment.new
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    Tweet.create(title: create_params[:title],text: create_params[:text], user_id: current_user.id)
      redirect_to :root and return
  end
  
  def edit
     @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(update_params) if tweet.user_id == current_user.id
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    redirect_to :root and return
  end
  
  private
  def create_params
    params.require(:tweet).permit(:title,:text).merge(user_id: current_user.id)
  end
  
  def update_params
    params.require(:tweet).permit(:title,:text)
  end
end
