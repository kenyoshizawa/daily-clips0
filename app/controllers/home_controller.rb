class HomeController < ApplicationController
  def index
    if logged_in?
      @room = Room.new
      @rooms = Room.all
      # @rooms = current_user.rooms
      # @nonrooms = Room.where(id: UserRoom.where.not(user_id: current_user.id).pluck(:id))
    end
  end
end
