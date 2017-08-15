class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    @genre = @song.genre
    @artist = @song.artist
  end

  def new
    @song = Song.new
  end

  def create
    @genre = Genre.find_or_create_by(id: params[:song][:genre_id])
    @artist = Artist.find_or_create_by(id: params[:song][:artist_id])
    @song = Song.create(song_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)

  end

  def edit
    @song = Song.find(params[:id])


  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)

  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)

  end

end
