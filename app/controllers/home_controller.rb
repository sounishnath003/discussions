class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if user_signed_in?
      @discussions = Discussion.where('user_id =?', current_user.id)
    end
  end
end
