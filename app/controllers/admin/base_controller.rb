class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!
  before_action :check_admin

  private

  def authenticate_admin!
    unless current_user&.admin?
      redirect_to posts_path, alert: "管理者ログインが必要です。"
    end
  end

  def check_admin
    unless current_user&.admin?
      redirect_to posts_path, alert: "管理者権限が必要です。"
    end
  end
end