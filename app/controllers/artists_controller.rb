class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def create
    @artist = Artist.create(artist_parameters)
    @artist.save
    redirect_to artist_path(@artist)
  end

  def new
    @artist = Artist.new
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params.require(:id))
    @artist.update(artist_parameters)
    redirect_to artist_path(@artist)
  end

  # private

  def artist_parameters
    params.require(:artist).permit(:name, :bio)
  end

end
