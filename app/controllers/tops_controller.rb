class TopsController < ApplicationController
  
  def index
    @tweet = Tweet.includes(:user).all.order("created_at DESC")
  end
  
end
