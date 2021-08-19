class UsersController < ApplicationController
  before_action :authenticate_user!
impressionist :actions => [:show], :unique => [:impressionable_id, :ip_address]

  def index
    redirect_to new_user_registration_path
  end

  def show
     @user = User.find(params[:id])
     impressionist(@user, nil, unique: [:ip_address])
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
    if @user != current_user
     redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "編集完了しました"
       redirect_to user_path(@user.id)
    else
      flash[:danger] = "編集に失敗しました"
      render:edit
    end
  end

  def user_params
    params.require(:user).permit(:nickname, :profile_image, :introduction)
  end

end
