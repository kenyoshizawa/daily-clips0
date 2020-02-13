class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def create
    @room = Room.create(room_params)
    current_user.user_rooms.create(room_id: @room.id)
    redirect_to(root_url)
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
