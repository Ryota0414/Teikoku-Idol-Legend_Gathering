class Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def new
    @post = Post.new
  end

  def index
    active_user_ids = User.where(is_deleted: false).ids
    @posts = Post.where(user_id: active_user_ids)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  #def tag_filter
    ##　中間テーブルから特定のジャンルのレコードをとってくる
    #post_genre = PostGenre.where(genre_id: params[:genre_id])
    ## とってきたレコードからぽすとIDを取得
    #post_ids = post_genre.map(&:post_id)
    ## ポストIDからポストレコードを取得
    #@posts = Post.where(id: post_ids)
  #end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to action: 'index'
    else
      render :new
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.post_genres.destroy_all
    post.destroy
    redirect_to user_path(current_user)
  end
  
private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
  
  def post_params
    params.require(:post).permit(:title, :body, :image, genre_ids: [])
  end

  def is_matching_login_user
    @post = Post.find(params[:id])
     unless @post.user_id == current_user.id
        redirect_to posts_path
     end
  end
end