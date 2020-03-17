class TweetsController < ApplicationController
  def index
  end
  
  def show
    @tweet = Tweet.find(params[:id])
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
    @tweet = Tweet.find(params[:id])
    @tweet.update(update_params)
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    redirect_to :root and return
  end
  
  private
  def create_params
    params.permit(:title,:text)
  end
  
  def update_params
    params.permit(:title,:text)
  end
end
