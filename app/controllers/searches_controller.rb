class SearchesController < ApplicationController
  def search
    @value = params[:value]
    @model = params[:model]
    @how = params[:how]
    @datas = search_for('partical', @model, @value)
  end


   private

  def partical(model, value)
    if model == 'user'
      User.where("nickname LIKE ?", "%#{value}%")
    elsif model == 'hobby'
      Hobby.where("name LIKE ?", "%#{value}%")
    end
  end

  def search_for(how, model, value)
    case how
    when 'partical'
      partical(model, value)
    end
  end
end
