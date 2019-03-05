class HomeController < ApplicationController
  def index
    # if user_signed_in?
    #   @discussions = Discussion.where('user_id =?', current_user.id)
    # else
    #   @discussions = Discussion.all.order("created_at DESC")
    # end
    @discussions = Discussion.all.order("created_at DESC")
  end

end # end of class
