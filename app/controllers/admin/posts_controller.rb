class Admin::PostsController < ApplicationController
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
  end
  
  def destroy
    post = Post.find(params[:id])
    post.post_genres.destroy_all
    post.destroy
    redirect_to posts_path
  end
end

private

  def post_params
    params.require(:post).permit(:title, :body, images: [], genre_ids: [])
  end
