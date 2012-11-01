class ApplicationController < ActionController::Base
  protect_from_forgery
#  before_filter :authenticate_user!
private

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_session_path # Prevents the current action from running
    end
  
  end
  

  private

  def validate_user() #might need to pass id and current_user
    if current_user.id == params[:user_id]
      # continue to current_user url
    else
        flash[:error] = "Please access one of your own pages"
        redirect_to(:back)
    end
  end
end


