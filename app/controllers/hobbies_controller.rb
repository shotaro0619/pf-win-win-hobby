class HobbiesController < ApplicationController

  def index
  end

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
    @hobbies = Hobby.
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def hobby_params
    params.require(:hobby).permit(:name, :comment)
  end

end
