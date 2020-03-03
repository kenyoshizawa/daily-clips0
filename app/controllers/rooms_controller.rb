class RoomsController < ApplicationController
  before_action :require_user_logged_in

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages

    url = @room.url.scan(/\?v=([^&]+)/).flatten
    @room.url = url[0]
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      current_user.user_rooms.create(room_id: @room.id)
      # flash[:success] = 'Roomを作成しました。'
      redirect_to(room_url(@room.id))
    else
      # flash.now[:danger] = 'Roomの作成に失敗しました。'
      render 'rooms/new'
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, :comment, :url)
  end
end
