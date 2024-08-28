class Public::HomesController < ApplicationController
  def top
    if current_user
      redirect_to posts_path
    elsif current_admin
      redirect_to posts_path
    end
  end

  def about
  end
end
