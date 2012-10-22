class TweetsController < ApplicationController
  def create
    t = Tweet.new(:message=>params[:tweet][:message])
    t.zombie_id = params[:tweet][:zombie_id]
    t.save
    redirect_to zombie_path params[:tweet][:zombie_id]
  end
end
