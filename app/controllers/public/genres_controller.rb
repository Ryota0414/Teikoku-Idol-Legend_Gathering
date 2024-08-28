class Public::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end
  
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
