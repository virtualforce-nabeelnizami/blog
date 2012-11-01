class HomeController < ApplicationController
  def index

    @posts = Post.limit(5)
    @users = User.limit(3)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json => @posts }
    end
  end
end