class HomeController < ApplicationController
  def index
    # if user_signed_in?
    #   @discussions = Discussion.where('user_id =?', current_user.id)
    # else
    #   @discussions = Discussion.all.order("created_at DESC")
    # end

    if params[:tag]
      @discussions = Discussion.tagged_with(params[:tag])
    else
      @discussions = Discussion.all.order("created_at DESC")
    end #end of if
  end # method index end

end # end of class
