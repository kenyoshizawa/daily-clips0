class HomeController < ApplicationController
  def index
    if logged_in?
      # @room = Room.find(params[:id])
      @rooms = Room.last(8)
      # url = @room.url.scan(/\?v=([^&]+)/)
      # new_url = url.flatten
      # @room.url = new_url[0]
      # @rooms = current_user.rooms
      # @nonrooms = Room.where(id: UserRoom.where.not(user_id: current_user.id).pluck(:id))
    end
  end
end
