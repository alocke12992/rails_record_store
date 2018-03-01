class GenresController < ApplicationController

 before_action :set_genre, only: [:show, :update, :edit, :destroy]
  
  def index
    @genres = Genre.all 
  end

  def show
  end

  def new
    @genre = Genre.new 
    
  end

  def edit
    
  end 

  def create 
    @genre = Genre.new(genre_params)

    if @genre.save 
      redirect_to genres_path
    else 
      render :new 
    end  
  end 

  def update
    if @genre.update(genre_params)
      redirect_to @genre
    else
      render :edit
    end
  end

  def destroy
    @genre.destroy
    redirect_to genre_path
  end
  


  private 

    def set_genre
      @genre = Genre.find(params[:id])
    end 

    def genre_params 
      params.require(:genre).permit(:name)
    end 

  
end
