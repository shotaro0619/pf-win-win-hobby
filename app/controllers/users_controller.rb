class UsersController < ApplicationController
impressionist :actions=> [:show]

  def show
     @user = User.find(params[:id])
     impressionist(@user, nil, unique: [:impressionable_id, :ip_address])
     @hobbies = @user.hobbies.page(params[:page]).reverse_order
     @currentUserEntry=Entry.where(user_id: current_user.id)
     @userEntry=Entry.where(user_id: @user.id)
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        if @isRoom
        else
          @room = Room.new
          @entry = Entry.new
        end
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def user_params
    params.require(:user).permit(:nickname, :profile_image, :introduction)
  end

end
