class HobbiesController < ApplicationController

  def new
    @hobby = Hobby.new
  end

  def create
    @hobby = Hobby.new(hobby_params)
    @hobby.user_id = current_user.id
    @hobby.save
    redirect_to hobbies_path
  end

  def index
    @hobbies = Hobby.page(params[:page]).reverse_order
  end

  def teacher
    @hobbies = Hobby.page(params[:page]).reverse_order
  end

  def student
    @hobbies = Hobby.page(params[:page]).reverse_order
  end

  def show
    @hobby = Hobby.find(params[:id])
  end

  def edit
    @hobby = Hobby.find(params[:id])
  end

  def update
    @hobby = Hobby.find(params[:id])
    @hobby.update(hobby_params)
    redirect_to hobbies_path
  end

  def destroy
    @hobby = Hobby.find(params[:id])
    @hobby.destroy
    redirect_to user_path(current_user)
  end

  private

  def hobby_params
    params.require(:hobby).permit(:name, :comment, :genre_id)
  end

end
