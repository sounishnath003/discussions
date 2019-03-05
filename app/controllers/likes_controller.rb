class LikesController < ApplicationController
  before_action :find_post
  
  def create
    @discussion.likes.create(user_id: current_user.id)
    redirect_to @discussion
  end

  private
  def find_post
    @discussion  Discussion.find(params[:id])
  end
end
