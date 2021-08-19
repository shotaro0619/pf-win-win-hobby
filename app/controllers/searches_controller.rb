class SearchesController < ApplicationController
  
  def search
    @value = params[:value]
    @model = params[:model]
    @datas = search_for('partical', @model, @value)
    @hobbies = Hobby.page(params[:page]).per(10).order('updated_at DESC')
  end


   private

  def partical(model, value)
    if model == 'user'
      Hobby.where(user_id: User.where("nickname LIKE ?", "%#{value}%").pluck(:id))
    elsif model == 'hobby'
      Hobby.where("name LIKE ?", "%#{value}%")
    elsif model == 'genre'
      Genre.find_by(name: value).hobbies
    end
  end

  def search_for(how, model, value)
    case how
    when 'partical'
      partical(model, value)
    end
  end
end
