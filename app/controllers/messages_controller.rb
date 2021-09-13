class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  # def create
  #   if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
  #     @message = Message.new
  #     @room_notification = @message.room
  #     Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
  #     @room = Room.find(params[:message][:room_id])
  #     @messages = @room.messages

  #     # redirect_to "/rooms/#{@message.room_id}"
  #   else
  #     flash[:alert] = "メッセージ送信に失敗しました。"
  #     redirect_back(fallback_location: root_path)
  #   end
  # end

  def create
        if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
          @message = Message.new
          Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
          # ここから
          @room_notification=@message.room
          @room = Room.find(params[:message][:room_id])
          @messages = @room.messages
          # ここまでを追加
          if @message.save
            # ここから
            @roommembernotme=Entry.where(room_id: @room_notification.id).where.not(user_id: current_user.id)
            @theid=@roommembernotme.find_by(room_id: @room_notification.id)
            notification = current_user.active_notifications.new(
                room_id: @room_notification.id,
                message_id: @message.id,
                visited_id: @theid.user_id,
                visitor_id: current_user.id,
                action: 'dm'
            )
            # 自分の投稿に対するコメントの場合は、通知済みとする
            if notification.visitor_id == notification.visited_id
                notification.checked = true
            end
            notification.save if notification.valid?
          end
        else
          redirect_back(fallback_location: root_path)
        end
  end
    private
      def message_params
          params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id)
      end
end
