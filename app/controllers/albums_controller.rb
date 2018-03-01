class AlbumsController < ApplicationController
  before_action :set_genre
  before_action :set_album, only: [:show, :edit, :update, :destoy]
  def index
    @albums = @genre.albums
  end

  def show
    
  end

  def new

    @album = @genre.albums.new
    render partial: 'form'
  end

  def edit
    render partial: 'form'
  end

  def create 
    @album = @genre.albums.new(album_params)

    if @album.save
      redirect_to [@genre, @album]
    else 
      render :new 
    end 
  end 

  def update 
    if @album.update(album_params)
      redirect_to [@genre, @album]
    else 
      render :edit
    end 
  end 

  def destroy 
    @album.destroy 
    redirect_to genre_albums_path
  end 

  private 
    def set_genre 
      @genre = Genre.find(params[:genre_id])
    end 

    def set_album 
      @album = Album.find(params[:id])
    end 


    def album_params
      params.require(:album).permit(:title, :artist, :artwork)
    end 
end
