class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
      Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
      @room = Room.find(params[:message][:room_id])
      @messages = @room.messages
      @message = Message.new
      # redirect_to "/rooms/#{@message.room_id}"
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end
end
