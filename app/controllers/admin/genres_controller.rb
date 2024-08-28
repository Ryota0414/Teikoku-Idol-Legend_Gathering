class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all
  end
  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: 'Genre was successfully created.'
    else
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: 'Genre was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path, notice: 'Genre was successfully deleted.'
  end

  private

  def genre_params
    params.require(:genre).permit(:name,
                                  :body,
                                  :genre_image,
                                  :HP,
                                  :Vo,
                                  :Da,
                                  :Vi,
                                  :Vo_percent,
                                  :Da_percent,
                                  :Vi_percent,
                                  :super_HP,
                                  :super_Vo,
                                  :super_Da,
                                  :super_Vi,
                                  :super_Vo_percent,
                                  :super_Da_percent,
                                  :super_Vi_percent)
  end
end