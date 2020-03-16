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
    Tweet.create(text: create_params[:text], user_id: current_user.id)
      redirect_to :root and return
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    
  end
  
  private
  def create_params
    params.permit(:text)
  end
  
  def update_params
    params.permit(:text)
  end
end
