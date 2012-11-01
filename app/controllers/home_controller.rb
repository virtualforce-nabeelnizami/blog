class HomeController < ApplicationController
  def index
#    @categories = Category.all
    @posts = Post.all
    @users = User.limit(3)
#    @profile = @user.profiles.find(params[:profile])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json => @posts }
    end
  end
end