class ProfilesController < ApplicationController
  before_filter :require_login, :only => [:new, :edit, :update, :destroy]
  #  before_filter :validate_user, :only => [ :edit, :update, :destroy]
  # GET /profiles
  # GET /profiles.json
  def index
    #  if user_signed_in?
    if current_user.profile.blank?
      respond_to do |format|
        format.html { redirect_to new_profile_path }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    else
      @profile = current_user.profile
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @profile }
      end
  
    end
    #  else
    #    @profile = Profile.find(params[:id])
    #  end
  end
  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])
    #    @profile = Profile.find(params[:profile])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    puts "y-----------------------hehhhhhere is profile  ---#{@profile.inspect}"
 
    @profile = Profile.new
 puts "y-----------------------hehhhhhere is profile  ---#{@profile.inspect}"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
    unless @profile.user_id == current_user.id
      redirect_to root_path, notice: "You are not authorize to do this operation" and return
    end
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])
    @profile.user_id = current_user.id
    respond_to do |format|
      if @profile.save
        #        @user_asset = UserAsset.new(params[:user_asset])
        #        @user_asset.profile_id = @profile.id
        #        @user_asset.save!
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])
    @profile.user_id = current_user.id
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    unless @profile.user_id == current_user.id
      redirect_to root_path, notice: "You are not authorize to do this operation" and return
    end
    @profile.destroy

    respond_to do |format|
      format.html { render action: "new" }
      format.json { head :no_content }
    end
  end
  def dashboard
    @profile = current_user.profile
  end
end
