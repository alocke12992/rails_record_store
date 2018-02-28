class GenresController < ApplicationController
  before_action :set_genre, only:[:show, :update, :edit, :destroy]
  
  def index
    @genres = Genre.all 
  end

  def show
  end

  def new
    @genre = Genre.new 
  end

  private 

  def set_genre
    @genre = Genre.find(params[:id])
  end 
  
end
