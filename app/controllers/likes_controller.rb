class LikesController < ApplicationController
  before_action :find_post

  def create
    unless already_liked?
      @discussion.likes.create(user_id: current_user.id)
    else
      flash[:notice] = "You cannot do more than once."
    end
    redirect_to @discussion
  end

  private

  def already_liked?
    @discussion.likes.where(user_id: current_user.id, discussion_id: params[:discussion_id]).exists?
  end

  def find_post
    @discussion = Discussion.find(params[:discussion_id])
  end

end
