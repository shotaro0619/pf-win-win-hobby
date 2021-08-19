class HobbiesController < ApplicationController
before_action :authenticate_user!
  def new
    @hobby = Hobby.new
  end

  def create
    @hobby = Hobby.new(hobby_params)
    @hobby.user_id = current_user.id
    if @hobby.save
      flash.keep[:success] = "投稿ができました"
      redirect_to hobbies_path
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def index
    @hobbies = Hobby.page(params[:page]).per(10).order('updated_at DESC')
  end

  def teacher
    @hobbies = Hobby.joins(:user).where("users.category='先生'").page(params[:page]).per(10).order('updated_at DESC')
  end

  def student
    @hobbies = Hobby.joins(:user).where("users.category='生徒'").page(params[:page]).per(10).order('updated_at DESC')
  end

  def show
    @hobby = Hobby.find(params[:id])
  end

  def edit
    @hobby = Hobby.find(params[:id])
    if @hobby.user != current_user
      redirect_to hobbies_path
    end
  end

  def update
    hobby = Hobby.find(params[:id])
    if hobby.update(hobby_params)
      flash[:success] = "編集完了しました"
      redirect_to hobbies_path
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @user = current_user
    @hobbies = @user.hobbies.page(params[:page]).reverse_order
    hobby = Hobby.find(params[:id])
    if hobby.destroy
    else
      render :show
    end
  end

  private

  def hobby_params
    params.require(:hobby).permit(:name, :comment, :genre_id)
  end

end
