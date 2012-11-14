class PostsController < ApplicationController
  before_filter :require_login, :only => [:new, :edit, :update, :destroy]

  def index
    if params[:search].blank?
      if user_signed_in?
        @posts = current_user.posts
        
      else
        @posts = Post.all
      end
      

    else
      logger.info "iiiiiiii m here \n\n\n"
      @posts = Post.search params[:search]
    
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
#    @category = Category.find(params[:category])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    #    @post.user_id = current_user.id
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    #    if @post.user_id == current_user.id?

    #@post = Post.where(['user_id = ? AND author_id <> ?', current_user.id, current_user.id])
    @post = Post.find(params[:id])
#    @category = Category.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to root_path, notice: "You are not authorize to do this operation" and return
    end
    #    else
    #      format.html { redirect_to @post, notice: 'You are not authorize to edit this post.' }
    #  end
  end
  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    @post.name = current_user.fullname
    @category = Category.all
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
#    @category = Category.find(params[:id])
    @post.user_id = current_user.id
    @post.name = current_user.fullname
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to root_path, notice: "You are not authorize to do this operation" and return
    end
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
