class Admin::UsersController < ApplicationController
  before_action :correct_user
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5)
  end

  def edit
    @user = User.find(params[:id])
  end
  def withdraw
    @user = User.find(params[:user_id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    if @user.is_deleted?
      @user.update(is_deleted: false)
      flash[:notice] = "復活処理を実行いたしました"
    else 
      @user.update(is_deleted: true)
      flash[:notice] = "退会処理を実行いたしました"
      sign_out(@user)
    end
    redirect_to admin_users_path
  end
  
  private
  
  def correct_user
    if current_user
      redirect_to posts_path
    elsif !current_admin
      redirect_to root_path
    end
  end
end
