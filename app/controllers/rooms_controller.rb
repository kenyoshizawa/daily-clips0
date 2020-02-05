class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(room_params)
    @room.save
    current_user.user_rooms.create(room_id: @room.id)
    redirect_to(room_url(@room))
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
