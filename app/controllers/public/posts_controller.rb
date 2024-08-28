class Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def index
    @genres = Genre.all # ジャンルのリストを取得
    active_user_ids = User.where(is_deleted: false).ids
    if params[:genre_id].present?
      # ジャンルでフィルタリング
      post_ids = PostGenre.where(genre_id: params[:genre_id]).pluck(:post_id)
      @posts = Post.where(id: post_ids, user_id: active_user_ids).page(params[:page]).per(10)
    else
      @posts = Post.where(user_id: active_user_ids).page(params[:page]).per(10)
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

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

  def post_params
    params.require(:post).permit(:title, :body, images: [], genre_ids: [])
  end

  def is_matching_login_user
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to posts_path
    end
  end
end