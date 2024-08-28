class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]
    @genres = Genre.all
    if @range == "User"
      @users = User.where("name LIKE ?", "%#{@word}%").page(params[:page]).per(10)
    else
      @posts = Post.where("title LIKE ?", "%#{@word}%").page(params[:page]).per(10)
    end
  end
end
