class GenresController < ApplicationController
  def index
    @genres = Genre.where(label: "音楽系")
  end
end
