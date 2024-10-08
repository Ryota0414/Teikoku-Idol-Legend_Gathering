class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_users_path
    when User
      posts_path
    else
      posts_path
    end
  end
  
  def after_sign_out_path_for(resource)
    case resource
    when Admin
      root_path
    when User
      root_path
    else
      root_path
    end  
  end 

end