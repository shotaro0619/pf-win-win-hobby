class GenresController < ApplicationController
  def index
    @genre = Genre.find(1)
    @genre_2 = Genre.find(2)
  end
end
