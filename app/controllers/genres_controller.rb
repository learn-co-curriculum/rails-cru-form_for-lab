class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def create
    @genre = Genre.new
    @genre.name = params[:name]
    @genre.save
    redirect_to genre_path(@genre)
  end

  def new
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_parameters)
    redirect_to genre_path(@genre)
  end

  private

  def genre_parameters
    params.require(:genre).permit(:name)
  end

end
